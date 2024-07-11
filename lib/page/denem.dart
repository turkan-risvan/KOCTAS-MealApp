import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/page/search/search_viewmodel.dart';
import 'package:recipes_app/page/details/meal_details_page.dart';
import 'package:recipes_app/page/details/meal_details_viewmodel.dart';
import 'package:recipes_app/data/service/meal_service.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:dio/dio.dart';
 
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Search for meals using the search icon in the app bar.'),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Search';

  @override
  InputDecorationTheme get searchFieldDecorationTheme => InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.white60,
          fontSize: 20,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      );

  @override
  TextStyle get searchFieldStyle => TextStyle(
        color: Colors.white,
        fontSize: 20,
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white60),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<SearchViewModel>(
      builder: (context, model, child) {
        model.searchMeals(query);

        if (model.searchResults == null) {
          return Center(
            child: Text(
              "No results",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        if (model.errorMessage != null) {
          return Text(
            model.errorMessage!,
            style: TextStyle(color: Colors.red),
          );
        }

        return ListView.builder(
          itemCount: model.searchResults!.meals!.length,
          itemBuilder: (context, index) {
            final meal = model.searchResults!.meals![index];
            return ListTile(
              title: Text(
                meal.strMeal ?? '',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                meal.strCategory ?? '',
                style: TextStyle(color: Colors.white70),
              ),
              leading: meal.strMealThumb != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(meal.strMealThumb!),
                    )
                  : null,
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
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
