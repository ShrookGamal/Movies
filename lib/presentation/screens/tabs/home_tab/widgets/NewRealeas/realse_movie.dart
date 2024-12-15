import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/data/api/model/popular_response/result.dart';

import '../../../../../../core/utils/assets_manager.dart';

class RealseMovie extends StatefulWidget {
  Result result;

  RealseMovie({
    super.key,
    required this.result,
  });
  static const String baseUrl = 'https://image.tmdb.org/t/p/w500/';

  @override
  State<RealseMovie> createState() => _RealseMovieState();
}

class _RealseMovieState extends State<RealseMovie> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 127.7.h,
                // Adjust height as needed
                width: 96.8.w,
                // Adjust width as needed
                decoration: BoxDecoration(
                  color: ColorsManager.blackGray,
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl: widget.result.posterPath != null
                      ? RealseMovie.baseUrl + widget.result.posterPath!
                      : 'https://via.placeholder.com/150', // Fallback image
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
              InkWell(
                  onTap: onTap,
                  child: favorite
                      ? Image.asset(AssetsManager.doneMark)
                      : Image.asset(AssetsManager.addMark))
            ],
          ),
          /*Text(
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
    );
  }

  onTap() {
    setState(() {
      favorite = true;
    });
  }
}
