import 'package:flutter/material.dart';

class MovieBanner extends StatelessWidget {
  final String movieTitle;
  final String movieBackgroundImage;
  final double movieRating;

  const MovieBanner({
    super.key,
    required this.movieTitle,
    required this.movieBackgroundImage,
    required this.movieRating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150, maxHeight: 180),
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(3, 3),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
              image:
                  movieBackgroundImage.isNotEmpty
                      ? DecorationImage(fit: BoxFit.fill, image: NetworkImage(movieBackgroundImage))
                      : null,
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                if (movieBackgroundImage.isEmpty) ...[
                  Container(alignment: Alignment.center, color: Colors.grey),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.photo_camera, color: Colors.white70, size: 50),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 110),
                child: Text(
                  movieTitle,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              Row(
                children: [
                  Text(
                    movieRating.toStringAsFixed(1),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
