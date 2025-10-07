import 'package:flutter/material.dart';

import '../../../data/tmdb/models/movie.dart';

class MovieThumbnail extends StatefulWidget {
  final Movie movie;
  final double width;
  final double height;
  const MovieThumbnail({super.key, required this.movie, this.width = 120, this.height = 180});

  @override
  State<MovieThumbnail> createState() => _MovieThumbnailState();
}

class _MovieThumbnailState extends State<MovieThumbnail> {
  bool _showOverlay = false;

  @override
  Widget build(BuildContext context) {
    final imgUrl = widget.movie.posterPath ?? '';
    return GestureDetector(
      onTap: () => setState(() => _showOverlay = !_showOverlay),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: widget.width,
              height: widget.height,
              color: Colors.grey.shade900,
              child: imgUrl.isEmpty
                  ? const Icon(Icons.image_not_supported)
                  : Image.network(imgUrl, fit: BoxFit.cover),
            ),
          ),
          AnimatedOpacity(
            opacity: _showOverlay ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
              padding: const EdgeInsets.all(8),
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
