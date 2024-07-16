import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/data/repo/repository.dart';
import 'package:recipes_app/page/area/area_page.dart';
import 'package:recipes_app/page/area/area_viewmodel.dart';
import 'package:recipes_app/page/favorites/favorites_page.dart';
import 'package:recipes_app/page/favorites/favorites_viewmodel.dart';
import 'package:recipes_app/page/search/search_viewmodel.dart';
import 'package:recipes_app/page/search/search_page.dart';

class HomePage extends StatefulWidget {
  final MealFilterRepository mealFilterRepository;
  final SearchRepository searchRepository;
  final RandomRepository randomRepository;
  final AreaFilterRepository areaFilterRepository;

  HomePage({
    required this.mealFilterRepository,
    required this.searchRepository,
    required this.randomRepository,
    required this.areaFilterRepository,
  });

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
      ChangeNotifierProvider(
        create: (context) => SearchViewModel(widget.searchRepository),
        child: SearchPage(
          mealFilterRepository: widget.mealFilterRepository,
          randomRepository: widget.randomRepository,
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => AreaFilterViewModel(widget.areaFilterRepository),
        child: AreaFilterPage(areaFilterRepository: widget.areaFilterRepository),
      ),
      ChangeNotifierProvider(
        create: (context) => FavoritesViewModel(),  
        child: FavoritesPage(), 
      ),
      ProfilePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            icon: Icon(Icons.airplanemode_active_sharp),
            label: 'Area',
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
      body: _pages[_selectedIndex],
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Profile Page')),
    );
  }
}
