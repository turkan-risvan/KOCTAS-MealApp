import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/page/meal_random/meal_random_viewmodel.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MealRandomViewModel>(context, listen: false).fetchRandomMeal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Recipe'),
      ),
      body: Center(
        child: Consumer<MealRandomViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const CircularProgressIndicator();
            } else if (viewModel.errorMessage != null) {
              return Text('Error: ${viewModel.errorMessage}');
            } else if (viewModel.meal != null && viewModel.meal!.meals != null && viewModel.meal!.meals!.isNotEmpty) {
              final meal = viewModel.meal!.meals!.first;
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    meal.strMealThumb != null
                        ? Image.network(meal.strMealThumb!)
                        : Container(),
                    const SizedBox(height: 16),
                    Text('Yemek Adı: ${meal.strMeal ?? 'Bilgi yok'}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Kategori: ${meal.strCategory ?? 'Bilgi yok'}', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('Bölge: ${meal.strArea ?? 'Bilgi yok'}', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('Talimatlar: ${meal.strInstructions ?? 'Bilgi yok'}', style: TextStyle(fontSize: 16)),
                  ],
                ),
              );
            } else {
              return const Text('Veri bulunamadı');
            }
          },
        ),
      ),
    );
  }
}
