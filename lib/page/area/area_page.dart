// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
 

// class AreaPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => AreaViewModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Ülkelere Göre Yemekler'),
//         ),
//         body: Consumer<AreaViewModel>(
//           builder: (context, viewModel, child) {
//             if (viewModel.areas == null) {
//               viewModel.fetchAreas();
//               return Center(child: CircularProgressIndicator());
//             }

//             if (viewModel.errorMessage != null) {
//               return Center(
//                 child: Text(viewModel.errorMessage!),
//               );
//             }

//             return ListView.builder(
//               itemCount: viewModel.areas!.length,
//               itemBuilder: (context, index) {
//                 final area = viewModel.areas![index];
//                 return ListTile(
//                   title: Text(area.strArea ?? ''),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => MealByAreaPage(area: area.strArea!),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
