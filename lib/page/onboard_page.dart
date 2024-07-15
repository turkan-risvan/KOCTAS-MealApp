import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/data/service/meal_service.dart';
import 'package:recipes_app/model/meal_random/meal_random_model.dart';
import 'package:recipes_app/page/details/meal_details_page.dart';
import 'package:recipes_app/page/details/meal_details_viewmodel.dart';

class OnboardingSliderPage extends StatefulWidget {
  final RandomRepository randomRepository;

  OnboardingSliderPage({required this.randomRepository});

  @override
  _OnboardingSliderPageState createState() => _OnboardingSliderPageState();
}

class _OnboardingSliderPageState extends State<OnboardingSliderPage> {
  late Future<MealRandomModel> _randomMeal;

  @override
  void initState() {
    super.initState();
    //_randomMeal = widget.randomRepository.getRandomMeal(); // Missing semicolon added
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Meal'),
      ),
      body: FutureBuilder<MealRandomModel>(
        future: _randomMeal,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.meals!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return PageView.builder(
              itemCount: snapshot.data!.meals!.length,
              itemBuilder: (context, index) {
                Meal meal = snapshot.data!.meals![index];
                return _buildMealCard(meal);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildMealCard(Meal meal) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(meal.strMealThumb ?? ''),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.strMeal ?? '',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Category: ${meal.strCategory ?? ''}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Area: ${meal.strArea ?? ''}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                          create: (context) => MealDetailsViewModel(
                            MealDetailsRepository(MealService(Dio())),
                          ),
                          child: MealDetailsPage(mealId: meal.idMeal!),
                        ),
                      ),
                    );
                  },
                  child: Text('View Details'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
