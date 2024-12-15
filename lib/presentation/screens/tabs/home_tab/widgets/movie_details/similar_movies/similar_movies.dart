import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../../../../../../../core/utils/fonts_manager.dart';
import '../../../../../../../data/api/model/MovieLikeThis/Results.dart';

class SimilarMovies extends StatefulWidget {
  Results results;
  static const String baseUrl = 'https://image.tmdb.org/t/p/w500/';

  SimilarMovies({super.key, required this.results});

  @override
  State<SimilarMovies> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorsManager.grayAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 150.h, // Adjust height as needed
            width: 97.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(alignment: Alignment.topLeft, children: [
                  Container(
                      width: 129.w,
                      height: 122.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(SimilarMovies.baseUrl +
                              widget.results.posterPath!),
                          fit: BoxFit.cover,
                        ),
                      )),
                  InkWell(
                      onTap: onTap,
                      child: favorite
                          ? Image.asset(AssetsManager.doneMark)
                          : Image.asset(AssetsManager.addMark))
                ]),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: ColorsManager.yellow,
                      size: 15.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      widget.results.voteAverage.toString(),
                      style: AppStyle.rate,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTap() {
    favorite = true;
    setState(() {});
  }
}
