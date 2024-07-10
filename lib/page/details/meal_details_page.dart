import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/page/details/meal_details_viewmodel.dart';

class MealDetailsPage extends StatelessWidget {
  final String mealId;

  MealDetailsPage({required this.mealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details'),
      ),
      body: Consumer<MealDetailsViewModel>(
        builder: (context, viewModel, child) {
          viewModel.fetchMealDetails(mealId);

          if (viewModel.errorMessage != null) {
            return Center(
              child: Text(
                viewModel.errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          if (viewModel.mealDetails == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final meal = viewModel.mealDetails!.meals!.first;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (meal.strMealThumb != null)
                    Image.network(meal.strMealThumb!),
                  SizedBox(height: 16),
                  Text(
                    meal.strMeal ?? '',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(meal.strInstructions ?? ''),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
