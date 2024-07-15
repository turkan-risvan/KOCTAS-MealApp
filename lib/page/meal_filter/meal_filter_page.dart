import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/data/service/meal_service.dart';
import 'package:recipes_app/page/details/meal_details_page.dart';
import 'package:recipes_app/page/details/meal_details_viewmodel.dart';
import 'meal_filter_viewmodel.dart';
import 'package:dio/dio.dart';

class MealFilterPage extends StatefulWidget {
  @override
  _MealFilterPageState createState() => _MealFilterPageState();
}

class _MealFilterPageState extends State<MealFilterPage> {
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    Provider.of<MealFilterViewModel>(context, listen: false).listMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer<MealFilterViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.mealCategories == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: viewModel.mealCategories!.meals!.map((meal) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = meal.strCategory;
                        });
                        if (meal.strCategory != null) {
                          viewModel.filterMeals(meal.strCategory!);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Text(
                          meal.strCategory ?? '',
                          style: TextStyle(color: _selectedCategory == meal.strCategory ? Colors.orange : Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Consumer<MealFilterViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.errorMessage != null) {
                return Text(
                  viewModel.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                );
              }
              if (viewModel.filterResults == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  shrinkWrap: true,
                  itemCount: viewModel.filterResults!.meals!.length,
                  itemBuilder: (context, index) {
                    final meal = viewModel.filterResults!.meals![index];
                    return GestureDetector(
                      onTap: () {
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
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                                child: meal.strMealThumb != null
                                    ? Image.network(
                                        meal.strMealThumb!,
                                        fit: BoxFit.cover,
                                      )
                                    : const Placeholder(), // Placeholder for images not available
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    meal.strMeal ?? '',
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    meal.idMeal ?? '',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
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
            },
          ),
        ],
      ),
    );
  }
}
