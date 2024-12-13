import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

import '../../../../../../data/api/model/popular_response/result.dart';

class PopularMovies extends StatelessWidget {
  PopularMovies({super.key, required this.result,});

  Result result;

  String baseUrl = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(alignment: Alignment.center, children: [
        CachedNetworkImage(
          width: double.infinity,
          height: 217,
          imageUrl: baseUrl + result.backdropPath!,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              Center(child: Icon(Icons.error)),
        ),
          Icon(
            Icons.play_circle_filled,
            size: 60,
            color: Colors.white,
          ),
        ]),
        Positioned(
          top: 120,
          left: 5,
          child: Row(
            children: [
              Container(
                  width: 110,
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(baseUrl + result.posterPath!),
                      fit: BoxFit.cover,
                    ),
                  )),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    result.title ?? '',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                  Text(
                    result.releaseDate ?? '',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: ColorsManager.gray),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
