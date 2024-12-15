import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';
import 'package:movies_app/data/api/model/MovieLikeThis/Results.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/widgets/movie_details/similar_movies/similar_movies.dart';

import '../../../../../../../core/utils/colors_manager.dart';
import '../../../../../../../core/utils/fonts_manager.dart';

class Similar extends StatelessWidget {
  Similar({super.key, required this.id});

  String id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSimilarMovies(id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data?.success == false || snapshot.hasError) {
            return Text(
                snapshot.data?.massage ?? 'Check your internet connection');
          }
          List<Results> results = snapshot.data?.results ?? [];
          return Container(
            color: ColorsManager.blackGray,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "More Like This",
                    style: AppStyle.recommend,
                  ),
                ),
                SizedBox(
                  height: 180, // Set the height of the list
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SimilarMovies(results: results[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
