import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/page/details/meal_details_viewmodel.dart';

class MealDetailsPage extends StatelessWidget {
  final String mealId;

  MealDetailsPage({required this.mealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff774d),
      appBar: AppBar(
       backgroundColor: Color(0xffff774d),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (meal.strMealThumb != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(meal.strMealThumb!),
                  ),
                
                Container(
                   decoration: BoxDecoration(
                color: Colors.white,
                               borderRadius: BorderRadius.only(topRight: Radius.circular(50))
                              ),
                  child: Column(
                    children: [
                      Text(
                        meal.strMeal ?? '',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(meal.strInstructions ?? ''),
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
