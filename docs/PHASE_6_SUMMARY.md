# Phase 6 — Analytics + Settings + Reminders

> A beginner-to-intermediate friendly write-up covering:
> - what shipped in Phase 6, and why;
> - the Flutter / Dart concepts it demonstrates;
> - how the Android and iOS editions planned the same phase.

---

## 🎯 Phase Goal

Phase 6 closes the loop between learning and looking back:
- **Analytics:** streaks, totals, weekly and monthly progress, each roadmap's completion, an activity heatmap and how often goals were met;
- **Settings:** appearance (with Material You colors on Android 12+), a **real daily reminder** with the platforms' permission flows, reset progress, sync, developer switches and About;
- **platform services behind interfaces:** notifications, the wallpaper's colors and the developer switches are reached only through `domain/service`, so every Cubit and use case is tested with fakes.

---

## 🧱 What Was Implemented

- **Domain:**
  - `AppSettings` gains `themeMode`, `dynamicColor`, `reminderEnabled` and `reminderTime` (`ReminderTime`, stored as `HH:mm`);
  - `LearningAnalytics`, `PeriodCount`, `GoalCompletion`; `DeviceColors`, `AppInfo`;
  - pure functions: `weeklyCompletions`, `monthlyCompletions`, `activityByDay`, `heatmapStart`, `allEvents`, `goalCompletionRate`, `nextReminder`;
  - services: `ReminderScheduler`, `DynamicColorSource`, `DeveloperTools`;
  - use cases: `WatchAnalytics`, `UpdateThemeMode`, `UpdateDynamicColor`, `SetReminderEnabled`, `ChangeReminderTime`, `RefreshReminder`, `ResetProgress`.
- **Data:** the new settings in preferences (damaged values fall back to defaults); `ProgressRepository.resetProgress` over `UserDataDao.resetProgress` (one transaction); `CatalogPublisher` and `catalog_v2.json` (35 topics, 38 resources) for "Publish a catalog update".
- **Platform:**
  - `LocalNotificationsReminderScheduler`: lazy initialisation with no permission prompt at launch, then `requestNotificationsPermission` (Android 13+) or `requestPermissions` (iOS), the current zone from `flutter_timezone`, and one `zonedSchedule` with `DateTimeComponents.time` and `inexactAllowWhileIdle`;
  - `MaterialYouColorSource`: the wallpaper palette through `dynamic_color`, on Android only;
  - `FakeApiDeveloperTools` (the network and catalog switches);
  - Android: core library desugaring, `POST_NOTIFICATIONS`, `RECEIVE_BOOT_COMPLETED` and the scheduled-notification receivers; iOS: `UNUserNotificationCenter.current().delegate = self`.
- **App root:** `SettingsCubit` above `MaterialApp.router` (theme mode, and the wallpaper theme when dynamic color is on); `DeviceColors` and `AppInfo` resolved before `runApp`; the reminder refreshed at launch and on resume (`AppLifecycleListener`).
- **Design system:** `AnalyticsCard`, `ActivityHeatmap` (`CustomPainter`, five shades, a legend, a written summary), `ChartAxisLabel`, `AppTheme.fromWallpaper`, the `syncSummary` and theme-mode labels.
- **Analytics** (`AnalyticsCubit`): five cards, two bar charts with counts on the bars, completion per roadmap, the heatmap.
- **Settings** (`SettingsCubit` + `SettingsToolsCubit`): System / Light / Dark (a radio list at large text), Dynamic color (where available), the reminder with platform time pickers and the denied card, Sync catalog with its version, Reset progress after a confirmation, the developer switches, About.
- **About:** the version, the editions on other platforms, the licenses.
- **Tests:** 531 in total (61 new).

### Differences from the plan

- **No `AnalyticsRepository`:** the goals' activity stream (one `UNION ALL` of every completion and check-in) already holds every dated event. Analytics reuses it with the goals and the roadmap progress.
- **Two Settings Cubits:** the appearance is app-wide (`SettingsCubit`, above the router), while the reminder, data and developer actions belong to the screen (`SettingsToolsCubit`), as the architecture rules ask.
- **The editions in About are cards, not a table:** a three-column table can't wrap at 200 % text.
- **Inexact reminders on Android:** exact alarms need a special permission since Android 14, and a learning nudge doesn't need minute precision.

### Found and fixed during the phase

- **Every app-level test hung at its first line.** Reading the wallpaper palette in a `@preResolve` called the plugin's method channel inside `testWidgets`, before the first pump. The call never returned: no CPU used, and `--timeout` didn't fire. The test setup now answers the channel at once (conventions §11.58).
- **The dynamic color plugin's ready-made scheme is the wrong `ColorScheme`:** it's `flutter/material.dart`'s class, not `material_ui`'s (as in §11.55). The app takes only the palette's color and builds the scheme itself.
- **Two mutation checks:** counting the current goal period before it's met, and not turning the reminder off when permission is revoked, each made tests fail.

### Checked on devices

- **iOS simulator:** Analytics and Settings in light and dark; the iOS permission prompt; a reminder set a minute ahead **arrived**; the iOS time wheel; the setting persisted across a relaunch.
- **Android 16 emulator:** the app opened in the wallpaper's colors and switched to indigo with Dynamic color off; the Android 13+ prompt; Don't allow showed the card, and Open settings opened the app's notification settings; after a reinstall, Allow; the alarm was registered at 12:16 with a 31-second inexact window, and the notification **arrived** in the shade.

---

## 💙 Flutter / Dart Concepts Demonstrated

- **Derived analytics:** pure series functions over dated events; nothing is stored, so a completion anywhere moves every chart.
- **`fl_chart` with custom labels:** counts over the bars, axis labels capped at 150 % text, and a written summary instead of the bars for screen readers.
- **`CustomPainter`:** ~180 rounded cells drawn in one `paint`, with `shouldRepaint` comparing the inputs.
- **App-scoped state above the router:** a `BlocProvider` + `BlocBuilder` around `MaterialApp.router` switches `themeMode` and both themes for every screen.
- **`@preResolve`:** values read before `runApp` (preferences, the wallpaper's color, the app version), so the first frame is already right.
- **Zoned notifications:** `timezone` rules for the device's zone, a `TZDateTime` for the next occurrence, and a daily repeat that the system owns.
- **Permission flows:** ask only when the user turns the feature on; if denied, explain and link to the system settings; recheck on resume.
- **`AppLifecycleListener`:** reschedule on resume, which catches time zone changes and revoked permissions.
- **Adaptive widgets:** `SwitchListTile.adaptive`, `CircularProgressIndicator.adaptive`, Material's `showTimePicker` or a `CupertinoDatePicker` in a sheet.
- **Platform services behind interfaces:** fakes for notifications and links in tests; a mocked method channel where a plugin is touched during dependency setup.

---

## 🔁 Data Flow (this phase)

```
Turn the reminder on
switch ─▶ SettingsToolsCubit.setReminderEnabled(true) ─▶ SetReminderEnabledUseCase
  ─▶ ReminderScheduler.requestPermission()
       denied ─▶ setting stays off ─▶ NotificationsDeniedException ─▶ the "Allow notifications" card
       granted ─▶ scheduleDaily(19:00) ─▶ zonedSchedule(next 19:00 in the device's zone, repeat: time)
                ─▶ setReminderEnabled(true) ─▶ settings stream ─▶ SettingsCubit ─▶ "Every day at 7:00 PM"

App resumes ─▶ AppLifecycleListener ─▶ RefreshReminderUseCase
  on? ─▶ permission still there? ─▶ reschedule in the current zone : turn the setting off

Analytics
GoalsRepository.watchActivity (UNION ALL) × watchGoals × RoadmapRepository.watchRoadmaps
  ─▶ weeklyCompletions, monthlyCompletions, activityByDay, learningStreak, goalCompletionRate
  ─▶ LearningAnalytics ─▶ cards, bars, roadmaps, heatmap
```

---

## 📁 Important Files Added

| File | Purpose |
|------|---------|
| `lib/domain/calculation/{analytics,reminder}.dart` | The chart series; the next reminder. |
| `lib/domain/service/{reminder_scheduler,dynamic_color_source,developer_tools}.dart` | The platform interfaces. |
| `lib/core/platform/{local_notifications_reminder_scheduler,material_you_color_source}.dart` | Notifications; the wallpaper's colors. |
| `lib/core/network/{catalog_publisher,fake_api_developer_tools}.dart`, `assets/json/catalog_v2.json` | The developer switches and the next catalog. |
| `lib/features/settings/**`, `lib/features/analytics/**`, `lib/features/about/about_page.dart` | The screens and their Cubits. |
| `lib/core/design_system/widgets/{analytics_card,activity_heatmap,chart_axis_label}.dart` | Analytics widgets. |
| `android/app/build.gradle.kts`, `AndroidManifest.xml`, `ios/Runner/AppDelegate.swift` | Notification setup on both platforms. |
| `test/app/settings_analytics_flows_test.dart`, `test/helpers/fakes/fake_reminder_scheduler.dart` | Flows; the fake scheduler. |

---

## 🧩 Important Types Added

| Type | Kind | Responsibility | Why it lives here |
|------|------|----------------|-------------------|
| `LearningAnalytics`, `PeriodCount`, `GoalCompletion` | freezed | What Analytics shows | `domain/model` |
| `ReminderTime`, `AppThemeMode`, `DeviceColors`, `AppInfo` | value types | Settings and device facts | `domain/model` |
| `goalCompletionRate`, `weeklyCompletions`, `monthlyCompletions`, `activityByDay` | pure functions | The analytics | `domain/calculation` |
| `ReminderScheduler`, `DynamicColorSource`, `DeveloperTools` | interfaces | Platform and fake-API services | `domain/service` |
| `LocalNotificationsReminderScheduler`, `MaterialYouColorSource` | services | The plugins | `core/platform` |
| `SettingsCubit` | Cubit (app-wide) | Theme mode, dynamic color | above `MaterialApp.router` |
| `SettingsToolsCubit`, `AnalyticsCubit` | Cubits | Their screens | `features/*/cubit` |
| `ActivityHeatmap`, `AnalyticsCard` | widgets | Analytics display | `core/design_system/widgets` |

---

## 🌱 Folder Structure Changes

- **New:** `lib/features/{settings,analytics}/cubit/`, `lib/features/settings/widgets/`, `lib/features/analytics/widgets/`, `test/features/{settings,analytics,about}/`.
- **Replaced:** the Analytics and Settings placeholders are real screens; About shows the version and editions.

---

## 🤖🍏 Android / iOS Comparison

From the two native specs:

| Concept | Android (Kotlin) | iOS (Swift) | Flutter (Dart) |
|---|---|---|---|
| Analytics | streak, completed topics, weekly / monthly progress, completion chart | + Swift Charts, goal completion rate | cards, `fl_chart` bars, completion per roadmap, a painted heatmap, goal completion rate; written chart summaries |
| Reminder | WorkManager, a toggle | UserNotifications, toggle + time | one repeating zoned notification (`flutter_local_notifications`), toggle + time, permission flows on both, rescheduled on resume |
| Time picker | — | — | Material's clock on Android, a Cupertino wheel on iOS |
| Theme | dark mode, Material You | light / dark | System / Light / Dark; dynamic color on Android 12+ only |
| Reset progress | yes | yes | progress only, in one transaction; notes, goals and the catalog stay |
| Developer switches | — | — | Simulate network failure; Publish a catalog update (catalog v2) |
| About | — | — | version, licenses, the editions |

The Android spec's reminder runs a WorkManager job; a scheduled notification needs no background work at all, so the system rings it even when the app has been killed, and it survives reboots.

---

## 🎤 Interview Notes

**Q: Why a scheduled notification rather than a background job for a daily reminder?**
A: The system owns a scheduled notification: it rings at the time even if the app was killed, costs no background execution, and survives reboots with the boot receiver. A background job would wake the app every day just to post one.

**Q: How do you keep "7 PM" meaning 7 PM after the user flies to another time zone?**
A: Schedule it in the device's zone (`flutter_timezone` + `timezone`) with a daily repeat on the wall-clock time, and reschedule at launch and on resume, so a changed zone gets a fresh schedule.

**Q: The user denied notifications. What does the app do?**
A: The switch stays off; it never pretends. A card explains that notifications are off and opens the system's notification settings. On resume, the app checks again, and it turns the setting off if permission was revoked later.

**Q: Why is dynamic color Android-only?**
A: Material You derives the palette from the wallpaper, a feature of Android 12+. iOS has no system palette for apps to follow, so the app keeps its own indigo there and doesn't offer the switch.

**Q: How is "goals met" computed fairly?**
A: Over the last 30 days, each goal contributes the periods that have ended (met or not) and the current one only once it's met, since it hasn't been missed yet. Periods before the goal existed don't count.

**Q: How do you test code that uses notification plugins?**
A: Through an interface: use cases and Cubits get a fake scheduler that records calls and plays the user's answer. The plugin code is checked on devices, and any plugin touched during dependency setup gets a mocked channel in tests.

---

## 📝 Learning Checklist

- ✅ Derive analytics with pure functions over dated events
- ✅ Draw bar charts with `fl_chart` and a heatmap with `CustomPainter`, both readable by screen readers
- ✅ Put app-wide settings above the router, read before the first frame
- ✅ Schedule a daily zoned notification, with permission flows on both platforms
- ✅ Follow Material You on Android 12+ without `flutter/material`'s scheme
- ✅ Reset user progress in one transaction
- ✅ Keep plugins behind interfaces, and mock what dependency setup touches
- ⬜ Documentation, screenshots and the open-source files (Phase 7)

---

## 🚀 Future Improvements

- **Phase 7:** the full documentation set, screenshots, community files and the final CI.
- **Later:** a reminder that skips days already active (it needs a background check), per-roadmap analytics, exporting progress, and widgets on the home screen.
