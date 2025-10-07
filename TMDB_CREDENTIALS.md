# TMDB API Credentials

## Authentication Methods

### 1. API Key (v3 auth)
**API Key:** `58da31f2a41f86b707533f2c56379467`

Usage in URL:
```
https://api.themoviedb.org/3/movie/popular?api_key=58da31f2a41f86b707533f2c56379467
```

### 2. Read Access Token (v4 auth - Bearer Token)
**Bearer Token:** 
```
eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1OGRhMzFmMmE0MWY4NmI3MDc1MzNmMmM1NjM3OTQ2NyIsIm5iZiI6MTc1OTgzNzc0OS44MjQsInN1YiI6IjY4ZTRmZTM1MTUxOTM1OGFjNjI1YmZmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oWWcp7qVh78LsY2MVHoy_yf0nPg2lNyJBZ-yRf7kTf8
```

Usage in Headers:
```
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1OGRhMzFmMmE0MWY4NmI3MDc1MzNmMmM1NjM3OTQ2NyIsIm5iZiI6MTc1OTgzNzc0OS44MjQsInN1YiI6IjY4ZTRmZTM1MTUxOTM1OGFjNjI1YmZmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oWWcp7qVh78LsY2MVHoy_yf0nPg2lNyJBZ-yRf7kTf8
```

## Using in Flutter Application

### Current Implementation (API Key)
The app currently uses the API key method via `--dart-define`:
```bash
flutter run -d chrome --dart-define=TMDB_API_KEY=58da31f2a41f86b707533f2c56379467
```

### Alternative Implementation (Bearer Token)
To use the Bearer token instead, you would need to modify the `lib/data/tmdb/tmdb_service.dart` file to include the Authorization header:

```dart
final response = await http.get(
  Uri.parse('https://api.themoviedb.org/3/movie/popular'),
  headers: {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1OGRhMzFmMmE0MWY4NmI3MDc1MzNmMmM1NjM3OTQ2NyIsIm5iZiI6MTc1OTgzNzc0OS44MjQsInN1YiI6IjY4ZTRmZTM1MTUxOTM1OGFjNjI1YmZmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oWWcp7qVh78LsY2MVHoy_yf0nPg2lNyJBZ-yRf7kTf8',
    'Content-Type': 'application/json',
  },
);
```

## Security Note
⚠️ **IMPORTANT:** These credentials should NOT be committed to version control in a production application. Use environment variables or secure credential management systems instead.

## TMDB API Documentation
- [API Overview](https://developers.themoviedb.org/3/getting-started/introduction)
- [Authentication](https://developers.themoviedb.org/3/getting-started/authentication)
- [API Reference](https://developer.themoviedb.org/reference/intro/getting-started)
