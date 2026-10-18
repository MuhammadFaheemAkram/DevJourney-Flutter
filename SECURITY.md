# Security Policy

## Supported Versions

DevJourney is a learning/reference project. Security fixes are applied to the latest `main` only.

| Version | Supported |
|---------|:---------:|
| `main`  | ✅ |

## Reporting a Vulnerability

Please **do not** open a public issue for security problems.

Instead, email **muhammadfaheem004@gmail.com** with:

- a description of the issue and its impact;
- steps to reproduce (a proof of concept if possible);
- any suggested remediation.

You can expect an acknowledgement within a few business days.

## What the App Holds

DevJourney has **no backend, no account and no API key**. The "learning API" is a fake service that reads JSON files bundled with the app; the only network traffic is the web pages a user chooses to open.

- **The catalog and the user's data** (completions, bookmarks, notes, goals, check-ins, challenge work) live in a SQLite database (drift) in the app's documents directory. It is not encrypted at rest; it is protected by the operating system's app sandbox like any app's private files. Settings → Reset progress clears the progress; notes and goals stay until the app is removed.
- **Preferences** hold only the onboarding flag, the active roadmap, the catalog version, the appearance, dynamic color, the reminder (on/off and its time) and the last five searches.
- **Search is injection-safe:** user text reaches SQLite's FTS5 only as quoted words (`ftsQuery`), and always as a bound parameter, never concatenated into SQL. Note search uses `LIKE` with its wildcards escaped.
- **Links open only over https:** resources and links in notes go through `OpenLinkUseCase`, which refuses `http:`, `javascript:`, `file:`, app schemes and host-less URLs before the platform sees them, then opens the page in the in-app browser (Custom Tabs / SFSafariViewController).
- **Notes are rendered Markdown, not HTML:** `flutter_markdown_plus` builds widgets; nothing is evaluated.
- **Notifications** are local and scheduled on the device; nothing is sent anywhere.

The practical attack surface is small. Reports about data handling, link handling, dependency issues or unsafe patterns are still very welcome.
