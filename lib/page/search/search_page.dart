import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/page/search/search_viewmodel.dart';
 


class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Meals'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                Provider.of<SearchViewModel>(context, listen: false)
                    .searchMeals(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search meals...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Consumer<SearchViewModel>(
              builder: (context, model, child) {
                if (model.searchResults != null) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: model.searchResults!.meals!.length,
                      itemBuilder: (context, index) {
                        final meal = model.searchResults!.meals![index];
                        return ListTile(
                          title: Text(meal.strMeal ?? ''),
                          subtitle: Text(meal.strCategory ?? ''),
                          leading: meal.strMealThumb != null
                              ? CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(meal.strMealThumb!),
                                )
                              : null,
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
