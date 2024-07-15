// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:recipes_app/data/repo/repository.dart';
// import 'package:recipes_app/data/service/meal_service.dart';
// import 'package:recipes_app/page/details/meal_details_page.dart';
// import 'package:recipes_app/page/details/meal_details_viewmodel.dart';
// import 'favorites_viewmodel.dart';
 
// import 'package:dio/dio.dart';

// class FavoritesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorites'),
//       ),
//       body: Consumer<FavoritesViewModel>(
//         builder: (context, viewModel, child) {
//           if (viewModel.favorites.isEmpty) {
//             return Center(child: Text('No favorites yet.'));
//           }
//           return ListView.builder(
//             itemCount: viewModel.favorites.length,
//             itemBuilder: (context, index) {
//               final meal = viewModel.favorites[index];
//               return ListTile(
//                 leading: meal.strMealThumb != null
//                     ? Image.network(meal.strMealThumb!)
//                     : const Placeholder(),
//                 title: Text(meal.strMeal ?? ''),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ChangeNotifierProvider(
//                         create: (context) => MealDetailsViewModel(
//                           MealDetailsRepository(MealService(Dio())),
//                         ),
//                         child: MealDetailsPage(mealId: meal.idMeal!),
//                       ),
//                     ),
//                   );
//                 },
//                 trailing: GestureDetector(
//                   onTap: () {
//                     viewModel.removeFavorite(meal);
//                   },
//                   child: Icon(
//                     Icons.favorite,
//                     color: Colors.red,
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
