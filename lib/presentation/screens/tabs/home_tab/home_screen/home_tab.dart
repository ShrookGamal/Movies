

import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/home_screen/home_screen.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/widgets/popular/popular.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(child: HomeScreen())  ;
  }
}
