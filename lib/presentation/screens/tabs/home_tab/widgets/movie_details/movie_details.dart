
//ToDo if press in the movie it make i=you enter the page
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/fonts_manager.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/widgets/movie_details/similar_movies/similar.dart';

import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../data/api/model/popular_response/result.dart';

class MovieDetails extends StatefulWidget {
  Result result;

  MovieDetails({super.key, required this.result});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://image.tmdb.org/t/p/w500/';
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: ColorsManager.blackAccent,
          centerTitle: true,
          title: Text(
            widget.result.title ?? '',
            style: AppStyle.appBarTitle,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    width: double.infinity,
                    height: 217.h,
                    imageUrl: baseUrl + widget.result.backdropPath!,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                  const Icon(
                    Icons.play_circle_filled,
                    size: 60,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(widget.result.title ?? '', style: AppStyle.movieTitle),
              SizedBox(
                height: 5.h,
              ),
              Text(
                DateTime.parse(widget.result.releaseDate ?? '').year.toString(),
                style: AppStyle.date,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Stack(alignment: Alignment.topLeft, children: [
                    Container(
                        width: 129.w,
                        height: 199.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                baseUrl + widget.result.posterPath!),
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
                    width: 15.w,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          widget.result.overview ?? '',
                          style: AppStyle.overView,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ColorsManager.yellow,
                              size: 25.sp,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              widget.result.voteAverage.toString(),
                              style: AppStyle.voteAverage,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Similar(id: widget.result.id.toString())
            ],
          ),
        ),
      ),
    );
  }

  onTap() {
    favorite = true;
    setState(() {});
  }
}
