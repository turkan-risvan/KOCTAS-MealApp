import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/page/search/search_viewmodel.dart';
import 'package:recipes_app/page/details/meal_details_page.dart';
import 'package:recipes_app/page/details/meal_details_viewmodel.dart';
import 'package:recipes_app/data/service/meal_service.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:dio/dio.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                Provider.of<SearchViewModel>(context, listen: false)
                    .searchMeals(value);
              },
              decoration: const InputDecoration(
                hintText: 'Yemek ara...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Consumer<SearchViewModel>(
              builder: (context, model, child) {
                if (model.searchResults == null) {
                  return const Center(
                    child: Text("Yemek ara"),
                  );
                }

                if (model.errorMessage != null) {
                  return Text(
                    model.errorMessage!,
                    style: TextStyle(color: Colors.red),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: model.searchResults!.meals!.length,
                    itemBuilder: (context, index) {
                      final meal = model.searchResults!.meals![index];
                      return ListTile(
                        title: Text(meal.strMeal ?? ''),
                        subtitle: Text(meal.strCategory ?? ''),
                        leading: meal.strMealThumb != null
                            ? CircleAvatar(
                                backgroundImage:
                                    NetworkImage(meal.strMealThumb!),
                              )
                            : null,
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
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
