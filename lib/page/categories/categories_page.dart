// // categories_page.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:recipes_app/page/categories/categories_viewmodel.dart';

// class CategoriesPage extends StatefulWidget {
//   @override
//   _CategoriesPageState createState() => _CategoriesPageState();
// }

// class _CategoriesPageState extends State<CategoriesPage> {
//   @override
//   void initState() {
//     super.initState();
//     // ViewModel'in fetchCategories metodunu sayfa yüklendiğinde bir kez çağır
//     WidgetsBinding.instance.addPostFrameCallback((_) {  // ekrana çizilme işlemi yapıldıktan sonra belirli bir işlevi çalıştırlmak için çalışır.
//       Provider.of<CategoriesViewModel>(context, listen: false).fetchCategories();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Categories'),
//       ),
//       body: Center(
//         child: Consumer<CategoriesViewModel>(
//           builder: (context, viewModel, child) {
//             if (viewModel.isLoading) {
//               return const CircularProgressIndicator();
//             } else if (viewModel.categories != null) {
//               final categories = viewModel.categories!.categories!;
//               return ListView.builder(
//                 itemCount: categories.length,
//                 itemBuilder: (context, index) {
//                   final category = categories[index];
//                   return ListTile(
//                     leading: Image.network(category.strCategoryThumb ?? ''),
//                     title: Text(category.strCategory ?? ''),
//                     subtitle: Text(category.strCategoryDescription ?? ''),
//                   );
//                 },
//               );
//             } else {
//               return const Text('No categories found');
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
