import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/fonts_manager.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';
import 'package:movies_app/data/api/model/popular_response/result.dart';
import 'package:movies_app/data/api/model/top_rated_response/results.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/widgets/NewRealeas/Realse_movie.dart';
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
        //List<Result> result = snapshot.data?.results ?? [];
        List<Object> result = snapshot.data?.results ?? [];
        // Assuming `results` contains a list of movie objects

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Recommended",
                style:AppStyle.ReCommend,

              ),
            ),
            SizedBox(
              height: 150, // Set the height of the list
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: result.length,
                itemBuilder: ( BuildContext context,int  index) {
                  return ReCommendMovie(result: result[index]  as Result);
                },
              ),
            ),
          ],
        );
      },

    );

  }

}

