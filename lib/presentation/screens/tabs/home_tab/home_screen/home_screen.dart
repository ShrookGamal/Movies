import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/widgets/Recomended/recomended.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/widgets/popular/popular.dart';

import '../widgets/NewRealeas/realease.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: REdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Popular(),
              SizedBox(
                height: 25.h,
              ),
              ReleaseCheck(),
              SizedBox(
                height: 25.h,
              ),
              RecomendedCheck(),
            ],
          ),
        ),
      ),
    );
  }
}
