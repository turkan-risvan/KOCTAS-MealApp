import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/page/search/search_viewmodel.dart';
 

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Search'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              Provider.of<SearchViewModel>(context, listen: false).searchMeal(value);
            },
            decoration: InputDecoration(
              hintText: 'Search meals...',
              contentPadding: EdgeInsets.all(10),
            ),
          ),
          Expanded(
            child: Consumer<SearchViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.searchResults == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  // Burada searchResults kullanarak UI oluşturulabilir
                  return ListView.builder(
                    itemCount: viewModel.searchResults!.meals!.length,
                    itemBuilder: (context, index) {
                      final meal = viewModel.searchResults!.meals![index];
                      return ListTile(
                        title: Text(meal.strMeal ?? ''),
                        subtitle: Text(meal.strCategory ?? ''),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(meal.strMealThumb ?? ''),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
