import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/model/meal_details/meal_deails_model.dart';
import 'package:recipes_app/page/details/meal_details_page.dart';
import 'package:recipes_app/page/details/meal_details_viewmodel.dart';
import 'package:recipes_app/data/service/meal_service.dart';
import 'package:dio/dio.dart';
import 'favorites_viewmodel.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<FavoritesViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.favorites.isEmpty) {
            return const Center(child: Text('No favorites added'));
          }

          return FutureBuilder<List<MealDetailsModel>>(
            future: _fetchAllMealDetails(viewModel.favorites),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('Error loading meal details'));
              }

              final mealDetails = snapshot.data ?? [];
              if (mealDetails.isEmpty) {
                return const Center(child: Text('No meal details available'));
              }

              return ListView.builder(
                itemCount: mealDetails.length,
                itemBuilder: (context, index) {
                  final meal = mealDetails[index].meals!.first;
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: meal.strMealThumb != null
                          ? Image.network(meal.strMealThumb!, fit: BoxFit.cover, width: 50, height: 50)
                          : const Placeholder(),
                      title: Text(meal.strMeal ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.orange),
                        onPressed: () async {
                          await viewModel.removeFavorite(viewModel.favorites[index]);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              create: (context) => MealDetailsViewModel(
                                MealDetailsRepository(MealService(Dio())),
                              ),
                              child: MealDetailsPage(mealId: viewModel.favorites[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<List<MealDetailsModel>> _fetchAllMealDetails(List<String> mealIds) async {
    final repository = MealDetailsRepository(MealService(Dio()));
    return Future.wait(mealIds.map((id) => repository.fetchMealDetails(id)));
  }
}
