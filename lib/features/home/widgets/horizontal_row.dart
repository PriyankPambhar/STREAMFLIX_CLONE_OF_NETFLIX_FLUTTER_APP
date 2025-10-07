import 'package:flutter/material.dart';

import '../../../data/tmdb/models/movie.dart';
import 'movie_thumbnail.dart';

class HorizontalRow extends StatelessWidget {
  final String title;
  final List<Movie> items;
  const HorizontalRow({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 190,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final m = items[index];
              return MovieThumbnail(movie: m);
            },
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}
