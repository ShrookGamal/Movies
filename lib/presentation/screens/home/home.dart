import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/screens/tabs/browse/browse.dart';
import 'package:movies_app/presentation/screens/tabs/search/search_tab.dart';
import 'package:movies_app/presentation/screens/tabs/watch_list/watch_list.dart';

import '../tabs/home_tab/home_screen/home_screen.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = [HomeScreen(), const SearchScreen(), BrowseCategoryScreen(), const WatchList()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavBar(),
      body: tabs[currentIndex],
    );
  }

  buildBottomNavBar() => BottomNavigationBar(
          selectedItemColor: ColorsManager.yellow,
          unselectedItemColor: ColorsManager.gray,
          type: BottomNavigationBarType.shifting,
          elevation: 0,
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: ColorsManager.black,
                icon: Icon(
                  Icons.home,
                  size: 32,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: ColorsManager.black,
                icon: Icon(
                  Icons.search,
                  size: 32,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                backgroundColor: ColorsManager.black,
                icon: ImageIcon(AssetImage(AssetsManager.browseTab)),
                label: 'Browse'),
            BottomNavigationBarItem(
                backgroundColor: ColorsManager.black,
                icon: ImageIcon(AssetImage(AssetsManager.watchTab)),
                label: 'WatchList'),
          ]);

  void onTap(int index) {
    currentIndex = index;
    setState(() {});
  }
}
