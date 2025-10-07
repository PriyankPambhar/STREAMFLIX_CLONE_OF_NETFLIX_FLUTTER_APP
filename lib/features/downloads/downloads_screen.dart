import 'package:flutter/material.dart';
import '../../data/tmdb/models/movie.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  List<Movie> _downloadedMovies = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadDownloadedMovies();
  }

  void _loadDownloadedMovies() {
    // Simulate loading downloaded movies
    setState(() {
      _isLoading = true;
    });

    // Simulate API call delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
        // For demo purposes, we'll show empty downloads
        // In a real app, this would load from local storage
      });
    });
  }

  void _simulateDownload(Movie movie) {
    setState(() {
      _downloadedMovies.add(movie);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Started downloading ${movie.title}'),
        backgroundColor: const Color(0xFFE50914),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Downloads'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to download settings
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE50914)),
              ),
            )
          : _downloadedMovies.isEmpty
              ? _buildEmptyDownloadsView()
              : _buildDownloadsList(),
    );
  }

  Widget _buildEmptyDownloadsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.download_for_offline_outlined,
            size: 80,
            color: Colors.grey[600],
          ),
          const SizedBox(height: 16),
          Text(
            'No downloads yet',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Movies and TV shows you download will appear here',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to browse screen to find content to download
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE50914),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            icon: const Icon(Icons.search),
            label: const Text('Find Something to Download'),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _downloadedMovies.length,
      itemBuilder: (context, index) {
        final movie = _downloadedMovies[index];
        return _DownloadedMovieCard(
          movie: movie,
          onDelete: () {
            setState(() {
              _downloadedMovies.removeAt(index);
            });
          },
        );
      },
    );
  }
}

class _DownloadedMovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onDelete;

  const _DownloadedMovieCard({
    required this.movie,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Movie Poster
            Container(
              width: 80,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[800],
              ),
              child: const Icon(
                Icons.movie,
                color: Colors.white,
                size: 40,
              ),
            ),

            const SizedBox(width: 16),

            // Movie Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Downloaded • ${movie.voteAverage.toStringAsFixed(1)} ★',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 1.0, // Fully downloaded
                    backgroundColor: Colors.grey[800],
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFE50914)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Downloaded',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // Action Buttons
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.play_arrow, color: Color(0xFFE50914)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Playing ${movie.title}'),
                        backgroundColor: const Color(0xFFE50914),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.grey),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
