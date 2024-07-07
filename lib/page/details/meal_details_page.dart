import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/page/details/meal_details_viewmodel.dart';

class MealDetailsPage extends StatelessWidget {
  final String mealId;

  MealDetailsPage({required this.mealId});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MealDetailsViewModel>(context, listen: false);
    viewModel.fetchMealDetails(mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details'),
      ),
      body: Consumer<MealDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (viewModel.mealDetails == null) {
            return Center(child: Text('Failed to load meal details'));
          }

          final meal = viewModel.mealDetails!.meals!.isNotEmpty
              ? viewModel.mealDetails!.meals?.first
              : null;

          if (meal == null) {
            return Center(child: Text('Meal details not found'));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (meal.strMealThumb != null)
                  Image.network(meal.strMealThumb!),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (meal.strMeal != null)
                        Text(
                          meal.strMeal!,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      SizedBox(height: 16),
                      if (meal.strInstructions != null)
                        Text(
                          meal.strInstructions!,
                          style: TextStyle(fontSize: 16),
                        ),
                      // Diğer bilgiler eklenebilir, örneğin: meal.strCategory, meal.strArea, vb.
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
