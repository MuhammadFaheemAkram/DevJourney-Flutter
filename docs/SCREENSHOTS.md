# Screenshots

Captured on 2026-10-18 on an **iPhone 17 Pro simulator** (iOS, debug build, status bar fixed at 9:41) and an **Android 16 emulator** (Pixel 10 Pro, for dynamic color), then downscaled to 1000 px tall. Everything on screen is the demo progress, loaded with **Explore with demo progress** on a fresh install: its dates are relative, so it always shows a live streak and this week's goals.

## Light

| Welcome | Dashboard | Learning path |
|:---:|:---:|:---:|
| <img src="screenshots/welcome-light.png" width="250" alt="Welcome: the DevJourney path icon, 'Follow a roadmap, track your progress, keep notes and build a learning streak, all on your device.', four roadmaps to pick from (Flutter Developer selected, Backend Developer, AI Engineer, System Design) with their topic counts, a 'Start learning' button and an 'Explore with demo progress' link"> | <img src="screenshots/dashboard-light.png" width="250" alt="Dashboard: '6-day streak, learn something today to keep it going', the Flutter Developer roadmap at 58% with '7 of 12 topics completed' and a Continue button, Next up: State management (Intermediate, 1 h, bookmarked), then the Goals section with 'Read for 20 minutes, 0 of 1 check-in today'"> | <img src="screenshots/learning-path-light.png" width="250" alt="The Flutter Developer learning path: 7 of 12 topics at 58%, 'Your active roadmap', then sections on a vertical line: Dart 4/4 Complete and UI 3/3 Complete with checks, Architecture 0/3 expanded with State management, Dependency injection and Local persistence, and a 'Mark section complete' action"> |

| A topic | Challenges | Analytics |
|:---:|:---:|:---:|
| <img src="screenshots/topic-light.png" width="250" alt="Topic: Flutter Developer › Architecture, 'State management', Intermediate, 1 h, its description, three 'What you'll learn' objectives, a 'Mark complete' button, two resources (State management on docs.flutter.dev, Bloc library) with bookmark buttons, and 'Your notes' with Add note"> | <img src="screenshots/challenges-light.png" width="250" alt="Challenges: level chips (Any level selected), status segments (All, To do, In progress, Done), '12 challenges', then cards: FizzBuzz as a stream (Beginner, To do), Debounce a stream (Intermediate, Done), An LRU cache (Intermediate, To do), A responsive card grid (Beginner, In progress)"> | <img src="screenshots/analytics-light.png" width="250" alt="Analytics: cards for the current streak (6 days, not yet today), longest streak (6 days), topics completed (10 of 32, 31% of every roadmap), challenges solved (1) and goals met (30%, 6 of 20 periods in the last 30 days), then the weekly progress bars with a count over each"> |

| Analytics, scrolled |
|:---:|
| <img src="screenshots/analytics-heatmap-light.png" width="250" alt="Analytics scrolled: monthly bars for May to October, completion per roadmap (Flutter Developer 7 of 12 at 58%, Backend Developer 2 of 7, AI Engineer 0 of 7, System Design 1 of 6), and the activity heatmap of the last 26 weeks with a Less-to-More legend, the recent days shaded"> |

## Dark

| Search | A note's Preview | Goals |
|:---:|:---:|:---:|
| <img src="screenshots/search-dark.png" width="250" alt="Search for 'stream' in dark mode: '7 results', grouped as Topics (3): Streams, Local persistence, State management; Notes (1): Streams cheat sheet; Resources (1): Asynchronous programming: streams; Challenges (2), with every matched word in bold"> | <img src="screenshots/note-preview-dark.png" width="250" alt="The 'Streams cheat sheet' note in its Preview tab, dark mode: a heading, a bulleted list with bold text and inline code in light text on the dark page, and a dark code block"> | <img src="screenshots/goals-dark.png" width="250" alt="Goals in dark mode, Weekly selected: 'Complete 3 topics a week, 6 of 3 topics this week, Done this week · Resets tomorrow' and 'Solve a challenge every week, 1 of 1', both with full green bars, and an Add goal button"> |

| Settings |
|:---:|
| <img src="screenshots/settings-dark.png" width="250" alt="Settings in dark mode on iOS: Appearance (System, Light, Dark), the daily reminder switch off with its time at 7:00 PM, Data (Sync catalog, catalog version 1; Reset progress in red with what it clears), and Developer switches, all as iOS switches"> |

## Large text

Accessibility text size **AX3** (about 235 %), dark mode.

| Dashboard | Analytics | Settings |
|:---:|:---:|:---:|
| <img src="screenshots/large-text-dashboard.png" width="250" alt="Dashboard at AX3: the streak banner and the roadmap card stack their content, the progress ring above the title and the Continue button full width"> | <img src="screenshots/large-text-analytics.png" width="250" alt="Analytics at AX3: the cards go to one column (Current streak 6 days, Longest streak 6 days, Topics completed 10 of 32)"> | <img src="screenshots/large-text-settings.png" width="250" alt="Settings at AX3: Appearance becomes a list of System, Light and Dark radio buttons, and the reminder row wraps"> |

## Android, dynamic color

Android 16 emulator, light mode, Dynamic color on: the app takes its colors from the wallpaper instead of its own indigo.

| Dashboard | Settings |
|:---:|:---:|
| <img src="screenshots/android-dynamic-dashboard.png" width="250" alt="The Dashboard on Android with dynamic color: the same demo figures in the wallpaper's muted blue instead of indigo"> | <img src="screenshots/android-dynamic-settings.png" width="250" alt="Settings on Android with dynamic color: a 'Dynamic color, use the colors of your wallpaper' switch on, and Material switches"> |

## What to look for

- **One set of figures everywhere:** the Dashboard's 7 of 12, the path's sections, Analytics' bars and goals all come from the same completion rows, derived when each screen reads them. Nothing is stored twice.
- **Never color alone:** difficulty has bars in its icon, challenge status an icon and a word, met goals the word "Done", search matches bold text.
- **Search** ranks a title match first (the Streams topic) and groups by kind.
- **The note preview is readable in dark mode** because the Markdown renderer gets the app's own style sheet (conventions §11.55).
- **Platform touches:** iOS switches on iOS, Material switches and wallpaper colors on Android.
- **Large text:** cards stack, segments become radio buttons, and the tab labels keep their size (a long press shows them).

## Retaking them

```bash
fvm flutter build ios --simulator --debug
xcrun simctl uninstall booted co.bitfuse.flutter.devJourney        # a fresh install
xcrun simctl install booted build/ios/iphonesimulator/Runner.app
xcrun simctl launch booted co.bitfuse.flutter.devJourney           # then Explore with demo progress

xcrun simctl status_bar booted override --time 9:41 --dataNetwork wifi --wifiBars 3 --cellularBars 4 --batteryState charged --batteryLevel 100
xcrun simctl ui booted appearance dark                             # or light
xcrun simctl ui booted content_size accessibility-extra-large      # AX3; "large" is the default

xcrun simctl io booted screenshot docs/screenshots/<name>.png
sips -Z 1000 docs/screenshots/<name>.png                           # downscale (macOS)

xcrun simctl status_bar booted clear                               # afterwards
```

On Android: `adb exec-out screencap -p > docs/screenshots/<name>.png`, then the same `sips` step.

The demo's dates follow the device's date, so the day counts and the week's goals change with it.
