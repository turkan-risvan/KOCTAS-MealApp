import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/page/details/meal_details_viewmodel.dart';

class MealDetailsPage extends StatefulWidget {
  final String mealId;

  MealDetailsPage({required this.mealId});

  @override
  _MealDetailsPageState createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<MealDetailsViewModel>(context, listen: false);
    viewModel.fetchMealDetails(widget.mealId);
    viewModel.isFavorite(widget.mealId).then((value) {
      setState(() {
        isFavorite = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Details'),
      ),
      body: Consumer<MealDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Center(
              child: Text(
                viewModel.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (viewModel.mealDetails == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final meal = viewModel.mealDetails!.meals!.first;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (meal.strMealThumb != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(meal.strMealThumb!),
                    ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          meal.strMeal ?? '',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        IconButton(
                          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                          color: isFavorite ? Colors.red : null,
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                            viewModel.toggleFavorite(widget.mealId);
                          },
                        ),
                        Text(meal.strInstructions ?? ''),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
