# netflix

StreamFlix — Netflix-style Flutter UI clone.

## Getting Started

This project replicates a streaming app UI with a strong dark theme, bottom navigation, a dynamic home feed, and TMDB API integration.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

## TMDB API Key Setup

We integrate with The Movie Database (TMDB) for real movie/TV data. You must supply your own API key — we do not hardcode or bundle any keys.

1) Create a TMDB account and API key
   - Sign up or sign in at https://www.themoviedb.org/
   - Go to Settings ➜ API ➜ Create API Key (read access is sufficient)

2) Pass the key at runtime using dart-define
   - We read the key from an environment define named `TMDB_API_KEY` in `lib/core/config.dart`.
   - Example commands:

   Android (emulator/device):
   ```bash
   flutter run -d emulator-5554 --dart-define=TMDB_API_KEY=YOUR_TMDB_KEY
   ```

   Windows desktop:
   ```bash
   flutter run -d windows --dart-define=TMDB_API_KEY=YOUR_TMDB_KEY
   ```

   Chrome (web):
   ```bash
   flutter run -d chrome --dart-define=TMDB_API_KEY=YOUR_TMDB_KEY
   ```

If the key is missing, the app will throw a clear error at startup from `Config.ensureApiKey()`.

---

## Project Structure (key parts)

- `lib/core/theme.dart` — Dark theme and color system
- `lib/core/config.dart` — Reads `TMDB_API_KEY` from `--dart-define`
- `lib/features/...` — UI screens (home, search, coming soon, downloads, profile)
- `lib/data/tmdb/` — TMDB service and models

---

## Useful Commands

- Install dependencies:
  ```bash
  flutter pub get
  ```

- Run on Android (emulator started):
  ```bash
  flutter emulators --launch Pixel_6
  flutter run -d emulator-5554 --dart-define=TMDB_API_KEY=YOUR_TMDB_KEY
  ```

- Run on Windows:
  ```bash
  flutter run -d windows --dart-define=TMDB_API_KEY=YOUR_TMDB_KEY
  ```

- Format code:
  ```bash
  dart format .
  
