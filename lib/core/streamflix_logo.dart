import 'package:flutter/material.dart';

class StreamFlixLogo extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;

  const StreamFlixLogo({
    super.key,
    this.width = 200,
    this.height = 60,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFE50914), // Netflix Red
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Stream Text
          const Text(
            'STREAM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(width: 8),

          // Play Icon
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Color(0xFFE50914),
              size: 14,
            ),
          ),

          const SizedBox(width: 8),

          // Flix Text
          const Text(
            'FLIX',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Compact version for app bars
class StreamFlixLogoCompact extends StatelessWidget {
  final double size;

  const StreamFlixLogoCompact({
    super.key,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xFFE50914), // Netflix Red
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.play_arrow,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
