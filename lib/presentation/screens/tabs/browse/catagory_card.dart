import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/api/model/Catagory_response/Genres.dart';

class CategoryCard extends StatelessWidget {
  final Genres genre;
  final String baseUrl = 'api.themoviedb.org';

  CategoryCard({required this.genre, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration:

          BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: CachedNetworkImage(
            width: double.infinity,
            height: 217,
            imageUrl: genre.backdropPath != null
                ? baseUrl + genre.backdropPath!
                : 'https://via.placeholder.com/500x217', // Default image URL
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          alignment: Alignment.center,
          child: Text(
            'action',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
