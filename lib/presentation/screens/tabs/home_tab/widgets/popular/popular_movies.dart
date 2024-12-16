import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/fonts_manager.dart';

import '../../../../../../data/api/model/popular_response/result.dart';

class PopularMovies extends StatefulWidget {
  PopularMovies({super.key, required this.result,});

  Result result;

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  String baseUrl = 'https://image.tmdb.org/t/p/w500/';
  bool favorate = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(alignment: Alignment.center, children: [
          CachedNetworkImage(
            width: double.infinity,
            height: 217.h,
            imageUrl: baseUrl + widget.result.backdropPath!,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                Center(child: Icon(Icons.error)),
          ),
          const Icon(
            Icons.play_circle_filled,
            size: 60,
            color: Colors.white,
          )
        ]),
        Positioned(
          top: 100,
          left: 21,
          child: Row(
            children: [
              Stack(alignment: Alignment.topLeft, children: [
                Container(
                    width: 129.w,
                    height: 199.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage(baseUrl + widget.result.posterPath!),
                        fit: BoxFit.cover,
                      ),
                    )),
                InkWell(
                    onTap: onTap,
                    child: favorate
                        ? Image.asset(AssetsManager.doneMark)
                        : Image.asset(AssetsManager.addMark))
              ]),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: REdgeInsets.only(top: 100),
                child: Container(
                  width: 192.w,
                  child: Column(
                    children: [
                      Text(
                        widget.result.title ?? '',
                        style: AppStyle.popular,
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(
                        DateTime.parse(widget.result.releaseDate ?? '')
                            .year
                            .toString(),
                        style: AppStyle.date,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  onTap() {
    favorate = true;
    setState(() {});
  }
}
