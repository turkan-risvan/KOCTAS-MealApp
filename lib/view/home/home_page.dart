// import 'package:flutter/material.dart';
// import 'package:recipes_app/model/recipes_model1.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Random Recipe'),
//       ),
//       body: Center(
//         child: FutureBuilder<MealRandomModel?>(
//           future: fetchRandomRecipe(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             }

           
//             final meal = snapshot.data!.meals!.first;

//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Meal: ${meal.strMeal}'),
//                 Text('Category: ${meal.strCategory}'),
//                 Text('Area: ${meal.strArea}'),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
