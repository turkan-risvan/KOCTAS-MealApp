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
        title: Text('Favorites'),
      ),
      body: Consumer<FavoritesViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.favorites.isEmpty) {
            return Center(child: Text('No favorites added'));
          } else {
            return ListView.builder(
              itemCount: viewModel.favorites.length,
              itemBuilder: (context, index) {
                return FutureBuilder<MealDetailsModel>(
                  future: _fetchMealDetails(viewModel.favorites[index]),
                  builder: (context, mealSnapshot) {
                    if (mealSnapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (mealSnapshot.hasError) {
                      return Center(child: Text('Error loading meal details'));
                    } else {
                      final meal = mealSnapshot.data!.meals!.first;
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: meal.strMealThumb != null
                              ? Image.network(meal.strMealThumb!, fit: BoxFit.cover, width: 50, height: 50)
                              : Placeholder(),
                          title: Text(meal.strMeal ?? ''),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
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
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<MealDetailsModel> _fetchMealDetails(String mealId) async {
    final repository = MealDetailsRepository(MealService(Dio()));
    return await repository.fetchMealDetails(mealId);
  }
}
