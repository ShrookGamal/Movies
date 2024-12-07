import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/widgets/popular/popular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          HomeTab(),
        ],
      ),
    );
  }
}
