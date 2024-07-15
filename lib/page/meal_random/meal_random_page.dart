import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/data/service/meal_service.dart';
import 'package:recipes_app/page/details/meal_details_page.dart';
import 'package:recipes_app/page/details/meal_details_viewmodel.dart';
import 'meal_random_viewmodel.dart';

class MealRandomPage extends StatefulWidget {
  @override
  State<MealRandomPage> createState() => _MealRandomPageState();
}

class _MealRandomPageState extends State<MealRandomPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startFetchingRandomMeals();
    });
  }

  void _startFetchingRandomMeals() {
    final viewModel = Provider.of<RandomMealViewModel>(context, listen: false);
    viewModel.fetchRandomMeal(); // Fetch initial meal
    _timer = Timer.periodic(Duration(seconds: 7), (timer) {
      viewModel.fetchRandomMeal();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RandomMealViewModel>(context);

    return Scaffold(
      body: Center(
        child: viewModel.isLoading
            ? Container(color: Colors.white)
            : viewModel.errorMessage != null
                ? Text('Error: ${viewModel.errorMessage}')
                : viewModel.randomMeal == null
                    ? Text('No meal found')
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Image.network(
                                viewModel.randomMeal!.meals!.first.strMealThumb ?? '',
                                fit: BoxFit.cover, // Adjust as per your image requirements
                              ),
                              onTap: () {
                                final meal = viewModel.randomMeal!.meals!.first;
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
                            ),
                            // Optionally uncomment and use these if needed
                            // SizedBox(height: 10),
                            // Text(
                            //   viewModel.randomMeal!.meals!.first.strMeal ?? '',
                            //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold
                            // ),
                            // SizedBox(height: 10),
                            // Text(viewModel.randomMeal!.meals!.first.strCategory ?? ''),
                            // SizedBox(height: 10),
                            // Text(viewModel.randomMeal!.meals!.first.strArea ?? ''),
                            // SizedBox(height: 10),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Text(
                            //     viewModel.randomMeal!.meals!.first.strInstructions ?? '',
                            //     textAlign: TextAlign.center,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
      ),
    );
  }
}
