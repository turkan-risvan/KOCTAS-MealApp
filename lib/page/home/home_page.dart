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
  bool _isSearching = false;

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
      // appBar: AppBar(
      //   title: Text('Home Page'),
      //   actions: [
         
      //   ],
      // ),
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
      body:  _selectedIndex == 0
              ? Column(
                children: [
                     ChangeNotifierProvider(
                            create: (context) => SearchViewModel(widget.searchRepository),
                            child: Container(
                              height: 650,
                              color: Colors.orange,
                              width: double.infinity,
                              child: SearchPage(mealFilterRepository: widget.mealFilterRepository),
                            ),
                          ),
                  const SizedBox(height: 10),
                  // Column(
                  //   children: [
                  //     ChangeNotifierProvider(
                  //       create: (context) => MealFilterViewModel(widget.mealFilterRepository),
                  //       child: Container(
                  //         height: 500,
                  //         width: double.infinity,
                  //         child: MealFilterPage(),
                  //       ),
                  //     ),
                  //     Container(
                  //     height: 200,
                  //     width: 300,
                     
                  //     decoration: BoxDecoration(
                  //        color: Color(0xffff774d),
                  //       borderRadius: BorderRadius.circular(10)
                  //     ),
                  //     )
                  //   ],
                  // ),
                ],
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
