import 'package:flutter/material.dart';

import '../../../../data/api/api_manager/api_manager_srearch_discover.dart';
import '../../../../data/api/model/Catagory_response/Genres.dart';
import 'catagory_card.dart';

class BrowseCategoryScreen extends StatelessWidget {
  const BrowseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManagerP3.getCatagory(),
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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two items per row
              crossAxisSpacing: 8.0, // Horizontal space between items
              mainAxisSpacing: 8.0, // Vertical space between items
            ),
            itemCount: genres.length,
            itemBuilder: (context, index) {
              // final genre = genres[index];
              return CategoryCard(genre: genres[index]);
            },
          ),
        );
      },
    );
  }
}

