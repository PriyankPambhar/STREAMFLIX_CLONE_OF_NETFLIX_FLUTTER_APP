import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/config.dart';
import 'models/movie.dart';

class TmdbService {
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  final http.Client _client;
  final String _apiKey;

  TmdbService({http.Client? client})
      : _client = client ?? http.Client(),
        _apiKey = Config.tmdbApiKey {
    Config.ensureApiKey();
  }

  static String posterUrl(String? path, {int width = 500}) {
    if (path == null || path.isEmpty) return '';
    return 'https://image.tmdb.org/t/p/w$width$path';
    // Alternative/original size: https://image.tmdb.org/t/p/original
  }

  Future<List<Movie>> trending({String mediaType = 'movie', String timeWindow = 'week'}) async {
    // mediaType: all | movie | tv | person
    // timeWindow: day | week
    final uri = Uri.parse('$_baseUrl/trending/$mediaType/$timeWindow')
        .replace(queryParameters: {
      'api_key': _apiKey,
      'language': 'en-US',
    });
    return _getList(uri);
  }

  Future<List<Movie>> topRated() async {
    final uri = Uri.parse('$_baseUrl/movie/top_rated').replace(queryParameters: {
      'api_key': _apiKey,
      'language': 'en-US',
      'page': '1',
    });
    return _getList(uri);
  }

  Future<List<Movie>> popular() async {
    final uri = Uri.parse('$_baseUrl/movie/popular').replace(queryParameters: {
      'api_key': _apiKey,
      'language': 'en-US',
      'page': '1',
    });
    return _getList(uri);
  }

  Future<List<Movie>> nowPlaying() async {
    final uri = Uri.parse('$_baseUrl/movie/now_playing').replace(queryParameters: {
      'api_key': _apiKey,
      'language': 'en-US',
      'page': '1',
    });
    return _getList(uri);
  }

  Future<List<Movie>> upcoming() async {
    final uri = Uri.parse('$_baseUrl/movie/upcoming').replace(queryParameters: {
      'api_key': _apiKey,
      'language': 'en-US',
      'page': '1',
    });
    return _getList(uri);
  }

  Future<List<Movie>> similar(int movieId) async {
    final uri = Uri.parse('$_baseUrl/movie/$movieId/similar').replace(queryParameters: {
      'api_key': _apiKey,
      'language': 'en-US',
      'page': '1',
    });
    return _getList(uri);
  }

  Future<List<Movie>> search(String query) async {
    final uri = Uri.parse('$_baseUrl/search/movie').replace(queryParameters: {
      'api_key': _apiKey,
      'language': 'en-US',
      'query': query,
      'page': '1',
      'include_adult': 'false',
    });
    return _getList(uri);
  }

  Future<List<Movie>> _getList(Uri uri) async {
    final res = await _client.get(uri);
    if (res.statusCode != 200) {
      throw http.ClientException('TMDB error ${res.statusCode}: ${res.body}', uri);
    }
    final map = json.decode(res.body) as Map<String, dynamic>;
    final results = (map['results'] as List<dynamic>? ?? []);
    return results.map((e) => Movie.fromJson(e as Map<String, dynamic>)).toList();
  }
}
