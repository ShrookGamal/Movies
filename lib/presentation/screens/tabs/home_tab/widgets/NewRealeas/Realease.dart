import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/fonts_manager.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';
import 'package:movies_app/data/api/model/popular_response/result.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/widgets/NewRealeas/Realse_movie.dart';


class ReleaseCheck extends StatelessWidget {
  const ReleaseCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewReleasesMovies(),
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
        List<Object> result = snapshot.data?.results ?? [];

        // Assuming `results` contains a list of movie objects

        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
        "New Releases",
        style:AppStyle.NewRealse,

        ),
        ),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: result.length,
          itemBuilder: ( BuildContext context,int  index) {
          return RealseMovie(result: result[index]  as Result);
          },
          ),
        ),
        ],
        );
        },

    );

  }

}

