import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/fonts_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';
import 'package:movies_app/data/api/model/popular_response/result.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/widgets/NewRealeas/realse_movie.dart';

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
        List<Result> result = snapshot.data?.results ?? [];
        return Container(
          color: ColorsManager.blackGray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "New Releases",
                  style: AppStyle.newRealse,
                ),
              ),
              SizedBox(
                height: 180.h,
                child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: result.length,
          itemBuilder: ( BuildContext context,int  index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesManager.movieDetails,
                              arguments: result[index]);
                        },
                        child: RealseMovie(result: result[index]));
                  },
          ),
              )
            ],
          ),
        );
      },

    );

  }

}

