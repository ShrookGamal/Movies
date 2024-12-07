import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/api/api_manager/api_manager.dart';
import 'package:movies_app/data/api/model/popular_response/result.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/widgets/popular/popular_movies.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data?.success == false || snapshot.hasError) {
            return Text(
                snapshot.data?.massage ?? 'Check your internet connection');
          }
          List<Result> result = snapshot.data?.results ?? [];
          return CarouselSlider.builder(
            itemCount: result.length,
            itemBuilder: (BuildContext context, int index, int realIndex) =>
                PopularMovies(result: result[index]),
            options: CarouselOptions(
              height: 400.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              viewportFraction: 0.8,
            ),
          );
        });
  }
}
