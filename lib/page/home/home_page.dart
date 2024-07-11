import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/page/meal_filter/meal_filter_page.dart';
import 'package:recipes_app/page/meal_filter/meal_filter_viewmodel.dart';
import 'package:recipes_app/page/search/search_viewmodel.dart';
import 'package:recipes_app/page/search/search_page.dart';

class HomePage extends StatefulWidget {
  final MealFilterRepository mealFilterRepository;
  final SearchRepository searchRepository;

  HomePage({required this.mealFilterRepository, required this.searchRepository});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      HomePage(
        mealFilterRepository: widget.mealFilterRepository,
        searchRepository: widget.searchRepository,
      ),
     FavoritesPage(),
      FavoritesPage(),
      ProfilePage(),
    ];
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            mealFilterRepository: widget.mealFilterRepository,
            searchRepository: widget.searchRepository,
          ),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
         currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey, 
        onTap: _onItemTapped,
      ),
      // appBar: AppBar(
      //   title: Text('Home Page'),
      // ),
      body: _selectedIndex == 0
          ? SingleChildScrollView(
              child: Column(
                children: [
                  ChangeNotifierProvider(
                    create: (context) => SearchViewModel(widget.searchRepository),
                    child: Container(
                      height: 500,
                      color: Colors.red,
                      width: double.infinity,
                      child: SearchPage(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ChangeNotifierProvider(
                    create: (context) => MealFilterViewModel(widget.mealFilterRepository),
                    child: Container(
                      height: 500,
                      width: double.infinity,
                      child: MealFilterPage(),
                    ),
                  ),
                ],
              ),
            )
          : _pages[_selectedIndex],
    );
  }
}

 

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: Center(child: Text('Favorites Page')),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Profile Page')),
    );
  }
}
