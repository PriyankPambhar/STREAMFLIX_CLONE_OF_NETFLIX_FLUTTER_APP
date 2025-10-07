class Config {
  // Read TMDB API key from --dart-define at runtime:
  // flutter run --dart-define=TMDB_API_KEY=YOUR_KEY
  static const String tmdbApiKey = String.fromEnvironment('TMDB_API_KEY');

  static void ensureApiKey() {
    if (tmdbApiKey.isEmpty) {
      throw StateError(
        'TMDB_API_KEY is missing. Pass it via --dart-define=TMDB_API_KEY=YOUR_KEY',
      );
    }
  }
}
