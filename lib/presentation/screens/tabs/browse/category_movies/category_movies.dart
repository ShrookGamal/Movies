import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/fonts_manager.dart';
import 'package:movies_app/data/api/api_manager/api_manager_srearch_discover.dart';
import 'package:movies_app/data/api/model/Discover_Movie/Results.dart';
import 'package:movies_app/presentation/screens/tabs/browse/category_movies/movie_item.dart';

class CategoryMovies extends StatelessWidget {
  num id;

  String? categoryName;

  CategoryMovies({super.key, required this.id, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManagerP3.getDiscoverMovie(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data?.success == false || snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.data?.massage ?? 'Check your internet connection',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
          List<Results> results = snapshot.data?.results ?? [];
          return Scaffold(
            backgroundColor: ColorsManager.scaffoldBg,
            appBar: AppBar(
              backgroundColor: ColorsManager.grayAccent,
              centerTitle: true,
              title: Text(
                categoryName ?? '',
                style: AppStyle.appBarTitle,
              ),
            ),
            body: MovieItem(results: results),
          );
        });
  }
}
