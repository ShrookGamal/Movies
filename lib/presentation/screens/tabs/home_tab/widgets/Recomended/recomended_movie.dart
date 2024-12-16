import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/fonts_manager.dart';
import 'package:movies_app/data/api/model/top_rated_response/results.dart';

import '../../../../../../core/utils/assets_manager.dart';

class RecommendMovie extends StatefulWidget {
  Results result;

  RecommendMovie({
    super.key,
    required this.result,
  });
  static const String baseUrl = 'https://image.tmdb.org/t/p/w500/';

  @override
  State<RecommendMovie> createState() => _RecommendMovieState();
}

class _RecommendMovieState extends State<RecommendMovie> {
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
            height: 220.h, // Adjust height as needed
            width: 110.w,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 127.7.h,
                  child: CachedNetworkImage(
                    imageUrl: widget.result.posterPath != null
                        ? RecommendMovie.baseUrl + widget.result.posterPath!
                        : 'https://via.placeholder.com/150', // Fallback image
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
                SizedBox(
                  height: 5.h,
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
                      widget.result.voteAverage.toString(),
                      style: AppStyle.rate,
                    ),
                  ],
                ),
                Text(
                  widget.result.title ?? '',
                  style: AppStyle.rate,
                ),
                Text(
                  DateTime.parse(widget.result.releaseDate ?? '')
                      .year
                      .toString(),
                  style: AppStyle.date,
                )

                /*const SizedBox(height: 8),
                  Text(
                    result.title ?? 'Unknown Title', // Fallback title
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),*/
              ],
            ),
          ),
          InkWell(
              onTap: onTap,
              child: favorite
                  ? Image.asset(AssetsManager.doneMark)
                  : Image.asset(AssetsManager.addMark))
        ],
      ),
    );
  }

  onTap() {
    favorite = true;
    setState(() {});
  }
}
