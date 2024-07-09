// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:recipes_app/page/meal_filter/meal_filter_viewmodel.dart';
 

// class MealFilterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final viewModel = Provider.of<MealFilterViewModel>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Filter Meals'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Filter',
//                 border: OutlineInputBorder(),
//               ),
//               onSubmitted: (query) {
//                 viewModel.filterMeals(query);
//               },
//             ),
//             SizedBox(height: 20),
//             if (viewModel.errorMessage != null)
//               Text(viewModel.errorMessage!),
//             if (viewModel.filterResults != null)
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: viewModel.filterResults!.meals!.length,
//                   itemBuilder: (context, index) {
//                     final meal = viewModel.filterResults!.meals![index];
//                     return ListTile(
//                       title: Text(meal.strMeal ?? ''),
//                       leading: meal.strMealThumb != null
//                           ? Image.network(meal.strMealThumb!)
//                           : null,
//                     );
//                   },
//                 ),
//               ),
//             if (viewModel.filterResults == null && viewModel.errorMessage == null)
//               Center(
//                 child: CircularProgressIndicator(),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
