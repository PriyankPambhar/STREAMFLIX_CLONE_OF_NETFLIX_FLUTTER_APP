import 'package:flutter/material.dart';
import '../../data/mock/mock_movies.dart';
import '../../data/tmdb/models/movie.dart';
import 'widgets/home_banner.dart';
import 'widgets/horizontal_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Movie> items = mockMovies;
    final featured = items.first;

    return NotificationListener<UserScrollNotification>(
      onNotification: (_) => false,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.black.withOpacity(0.0),
            title: const Text('StreamFlix'),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeBanner(movie: featured),
                  const SizedBox(height: 12),
                  HorizontalRow(title: 'Trending Now', items: items),
                  const SizedBox(height: 16),
                  HorizontalRow(title: 'Top Rated', items: items.reversed.toList()),
                  const SizedBox(height: 16),
                  HorizontalRow(title: 'Continue Watching', items: items),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
