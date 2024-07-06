import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/repo/repostory.dart';
import 'package:recipes_app/view/meal/meal_page.dart';
 
import 'package:recipes_app/viewmodel/meal_random_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MealRandomViewModel(MealRepository()),
      child: MaterialApp(
        home: MealPage(),
      ),
    );
  }
}