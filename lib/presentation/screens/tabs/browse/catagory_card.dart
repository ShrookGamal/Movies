import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../data/api/model/Catagory_response/Genres.dart';

class CategoryCard extends StatelessWidget {
  final Genres genre;
  final String baseUrl = 'api.themoviedb.org';

  const CategoryCard({required this.genre, super.key});
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
            child: Image.asset(
              getImage(genre.name),
              fit: BoxFit.cover,
            )
            /*CachedNetworkImage(
            width: double.infinity,
            height: 217,
            imageUrl: genre.backdropPath != null
                ? baseUrl + genre.backdropPath!
                : 'https://via.placeholder.com/500x217', // Default image URL
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
          ),*/
            ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          alignment: Alignment.center,
          child: Text(
            genre.name ?? '',
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

  getImage(String? name) {
    switch (name) {
      case 'Comedy':
        return AssetsManager.comedyPoster;
      case 'Action':
        return AssetsManager.actionPoster;
      case 'Adventure':
        return AssetsManager.adventurePoster;
      case 'Animation':
        return AssetsManager.animationPoster;
      case 'Crime':
        return AssetsManager.crimePoster;
      case 'Documentary':
        return AssetsManager.docPoster;
      case 'Drama':
        return AssetsManager.dramaPoster;
      case 'Family':
        return AssetsManager.familyPoster;
      case 'Fantasy':
        return AssetsManager.fantasyPoster;
      case 'History':
        return AssetsManager.historyPoster;
      case 'Horror':
        return AssetsManager.horrorPoster;
      case 'Music':
        return AssetsManager.musicPoster;
      case 'Mystery':
        return AssetsManager.mysteryPoster;
      case 'Romance':
        return AssetsManager.romanticPoster;
      case 'Science Fiction':
        return AssetsManager.sciencePoster;
      case 'TV Movie':
        return AssetsManager.tvPoster;
      case 'Thriller':
        return AssetsManager.thrillerPoster;
      case 'War':
        return AssetsManager.warPoster;
      case 'Western':
        return AssetsManager.westernPoster;
    }
  }
}
