import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/data/service/meal_service.dart';
import 'package:recipes_app/page/area/area_viewmodel.dart';
import 'package:recipes_app/page/details/meal_details_page.dart';
import 'package:recipes_app/page/details/meal_details_viewmodel.dart';
import 'package:dio/dio.dart';

class AreaFilterPage extends StatefulWidget {
  final AreaFilterRepository areaFilterRepository;

  const AreaFilterPage({super.key, required this.areaFilterRepository});
  @override
  _AreaFilterPageState createState() => _AreaFilterPageState();
}

class _AreaFilterPageState extends State<AreaFilterPage> {
  String? _selectedArea;

  @override
  void initState() {
    super.initState();
    Provider.of<AreaFilterViewModel>(context, listen: false).listAreas().then((_) {
      final viewModel = Provider.of<AreaFilterViewModel>(context, listen: false);
      if (viewModel.areaCategories != null && viewModel.areaCategories!.meals!.isNotEmpty) {
        _selectedArea = viewModel.areaCategories!.meals!.first.strArea;
        viewModel.filterAreas(_selectedArea!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ülkeler")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<AreaFilterViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.areaCategories == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: viewModel.areaCategories!.meals!.map((meal) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _selectedArea = meal.strArea;
                            });
                            if (meal.strArea != null) {
                              viewModel.filterAreas(meal.strArea!);
                            }
                          },
                          child: Text(
                            meal.strArea ?? '',
                            style: TextStyle(
                              color: _selectedArea == meal.strArea ? Colors.orange : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer<AreaFilterViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.errorMessage != null) {
                  return Text(
                    viewModel.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  );
                }
                if (viewModel.filterResults == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
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
                                      : const Placeholder(), // Resimler için yer tutucu mevcut değil
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      meal.strMeal ?? '',
                                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
