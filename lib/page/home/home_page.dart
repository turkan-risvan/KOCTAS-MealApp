import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/page/meal_filter/meal_filter_page.dart';
import 'package:recipes_app/page/meal_filter/meal_filter_viewmodel.dart';
import 'package:recipes_app/page/search/search_page.dart';
import 'package:recipes_app/page/search/search_viewmodel.dart';

class HomePage extends StatelessWidget {
  final MealFilterRepository mealFilterRepository;
  final SearchRepository searchRepository;

  HomePage({required this.mealFilterRepository, required this.searchRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChangeNotifierProvider(
              create: (context) => SearchViewModel(searchRepository),
              child: Container(
                height: 500,
                  color: Colors.red,
                width: double.infinity,
                child: SearchPage()),
            ),
           

           SizedBox(height: 10,),
            ChangeNotifierProvider(
              create: (context) => MealFilterViewModel(mealFilterRepository),
              child: Container(
              
                height: 500,
                width: double.infinity,
                child: MealFilterPage()),
            ),
          ],
        ),
      ),
    );
  }
}
