import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/fonts_manager.dart';

import '../../../../../data/api/model/Discover_Movie/Results.dart';

class MovieItem extends StatelessWidget {
  List<Results> results;

  String baseUrl = 'https://image.tmdb.org/t/p/w500/';

  MovieItem({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: REdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      width: 140.w,
                      height: 100.h,
                      imageUrl: baseUrl +
                          (results[index].backdropPath ??
                              AssetsManager.placeHolder),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            results[index].title ?? '',
                            style: AppStyle.movieTitle,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            DateTime.parse(results[index].releaseDate ?? '')
                                .year
                                .toString(),
                            style: AppStyle.date,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 358.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: ColorsManager.divider),
                )
              ],
            ),
          );
        });
  }
}
