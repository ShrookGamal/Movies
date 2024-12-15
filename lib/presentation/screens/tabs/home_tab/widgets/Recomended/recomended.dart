import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/fonts_manager.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';
import 'package:movies_app/data/api/model/top_rated_response/results.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/widgets/Recomended/recomended_movie.dart';

class RecomendedCheck extends StatelessWidget {
  const RecomendedCheck({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getRecommendedMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || snapshot.data?.success == false) {
          return Center(
            child: Text(
              snapshot.data?.massage ?? 'Check your internet connection',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        List<Results> result = snapshot.data?.results ?? [];
        return Container(
          color: ColorsManager.blackGray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "Recommended",
                  style: AppStyle.recommend,
                ),
              ),
              SizedBox(
                height: 180, // Set the height of the list
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: result.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecommendMovie(result: result[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },

    );

  }

}

