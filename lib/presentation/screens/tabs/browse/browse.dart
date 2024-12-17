import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/fonts_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';

import '../../../../data/api/api_manager/api_manager_srearch_discover.dart';
import '../../../../data/api/model/Catagory_response/Genres.dart';
import 'catagory_card.dart';

class BrowseCategoryScreen extends StatelessWidget {
  const BrowseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManagerP3.getCategory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data?.success == false || snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.data?.massage ?? 'Check your internet connection',
              style: const TextStyle(color: Colors.white),
            ),
          );
        }
        List<Genres> genres = snapshot.data?.genres ?? [];
        return Scaffold(
          backgroundColor: ColorsManager.scaffoldBg,
          body: Padding(
            padding: REdgeInsets.only(top: 80.0, right: 10, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Browse Category',
                  style: AppStyle.browseCategory,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two items per row
                      crossAxisSpacing: 20.0, // Horizontal space between items
                      mainAxisSpacing: 20.0, // Vertical space between items
                    ),
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      // final genre = genres[index];
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesManager.categoryMovies,
                                arguments: {
                                  'id': genres[index].id,
                                  'name': genres[index].name
                                });
                          },
                          child: CategoryCard(genre: genres[index]));
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

