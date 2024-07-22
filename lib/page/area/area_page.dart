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

  // Resimlerin listesi
  final List<String> _areaImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXYFsSrBZl-4D7bBgav-iTBUFCu9vf2PubEDNzltuQ2F67St01TKxMXH5kRvOTjESjhes&usqp=CAU',
    'https://m.media-amazon.com/images/I/71KUWgkWhkL._AC_UF1000,1000_QL80_.jpg',
    'https://m.media-amazon.com/images/I/61TcZ33ZrJL._AC_SY575_.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREwDxL0mC8mM24jZlcCPShwdgFUSAQEXzgqsJz4C6Vj-BmAV21z6JLeDr4ss6td86FY-E&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5_WZBKxNqQVHC6l1WXVai1z6pFvVIj7f1x6F1PMTkyLLPwUEtWu352So5SOXk9JuCcx0&usqp=CAU',
    'https://w7.pngwing.com/pngs/711/749/png-transparent-netherlands-flag-round-icon-thumbnail.png',
    'https://w7.pngwing.com/pngs/869/161/png-transparent-flag-of-egypt-egyptian-premier-league-flag-of-croatia-egypt-emblem-flag-egypt.png'
  ];

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
      appBar: AppBar(title: Center(child: Text("Ülkeler"))),
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
                    children: viewModel.areaCategories!.meals!.asMap().entries.map((entry) {
                      final index = entry.key;
                      final meal = entry.value;
                      final imageUrl = index < _areaImages.length ? _areaImages[index] : '';

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
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                                backgroundColor: Colors.grey[200],
                                radius: 20,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                meal.strArea ?? '',
                                style: TextStyle(
                                  color: _selectedArea == meal.strArea ? Colors.orange : Colors.grey,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
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
                  return const Center(child: Text("Yükleniyor..."));
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
                                      style: const TextStyle(fontSize: 13),
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
