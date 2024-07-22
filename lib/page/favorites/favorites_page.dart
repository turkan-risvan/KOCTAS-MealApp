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
        title: const Center(child: Text('Favorites')),
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
                  final mealId = viewModel.favorites[index];

                  return Dismissible(
                    key: Key(mealId), // Her öğeye özgü bir anahtar verin
                    direction: DismissDirection.endToStart, // Sağdan sola kaydırma
                    onDismissed: (direction) async {
                      // Favorilerden kaldır
                      await viewModel.removeFavorite(mealId);

                      // SnackBar ile bildirim göster
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${meal.strMeal ?? ''} silindi.'),
                        ),
                      );
                    },
                    background: Container(
                      color: Colors.orange,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: Card(
                      shadowColor: Colors.orange,
                      elevation: 6,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      shape: RoundedRectangleBorder(

                        side: const BorderSide(color: Color.fromARGB(255, 243, 192, 162)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: meal.strMealThumb != null
                              ? Image.network(
                                  meal.strMealThumb!,
                                  fit: BoxFit.cover,
                                  width: 70,
                                  height: 70,
                                )
                              : const Icon(Icons.fastfood, size: 50, color: Colors.orange),
                        ),
                        title: Text(
                          meal.strMeal ?? '',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: Text(
                          meal.strCategory ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange,size: 20,),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                create: (context) => MealDetailsViewModel(
                                  MealDetailsRepository(MealService(Dio())),
                                ),
                                child: MealDetailsPage(mealId: mealId),
                              ),
                            ),
                          );
                        },
                      ),
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
