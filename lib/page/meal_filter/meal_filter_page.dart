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
    final viewModel = Provider.of<MealFilterViewModel>(context, listen: false);
    viewModel.listMeals().then((_) {
      // Kategoriler yüklendiğinde ilk kategoriyi seçili yap
      if (viewModel.mealCategories != null && viewModel.mealCategories!.meals!.isNotEmpty) {
        setState(() {
          _selectedCategory = viewModel.mealCategories!.meals!.first.strCategory;
        });
        viewModel.filterMeals(_selectedCategory!);
      }
    });
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
              // Eğer mealCategories null ise, boş bir widget döndür
              if (viewModel.mealCategories == null) {
                return const SizedBox(); // Veri yüklenirken hiçbir şey göstermemek için
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
                          style: TextStyle(
                            color: _selectedCategory == meal.strCategory ? Colors.orange : const Color(0xffd6d6d6),
                            fontSize: 16,
                            
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          Consumer<MealFilterViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.errorMessage != null) {
                return Text(
                  viewModel.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                );
              }
              if (viewModel.filterResults == null) {
                return const SizedBox(); // Veriler yüklenirken boş bir widget döndür
              }
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
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
                      child: Container(
                        width: 200,
                        // margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Card(
                          shadowColor: Colors.orange,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.orange, // Kenar rengi
                              width: 1.0, // Kenar genişliği
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 18, // Kartın görüntü oranını ayarlayın
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                                  child: meal.strMealThumb != null
                                      ? Image.network(
                                          meal.strMealThumb!,
                                          fit: BoxFit.cover,
                                        )
                                      : const Placeholder(),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 252, 127, 49),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      meal.strMeal ?? '',
                                      style: const TextStyle(fontSize: 14, color: Colors.white),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
