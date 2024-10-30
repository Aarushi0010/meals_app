import'package:flutter/material.dart';
import 'package:meals_app/screen/meals.dart';
import 'categories.dart';
class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }

}

  class _TabScreenState extends State<TabScreen>{

  int _selectedPageIndex = 0 ;

  void _selectPage (int index){
    setState(() {
      _selectedPageIndex= index ;
    });
  }

  @override
    Widget build(context){
    Widget activePage = const CategoriesScreen();
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1)
      activePage = MealScreen(meals: []);
    activePageTitle = 'Your Favourites';
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: const  [
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: 'Category '),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites '),
        ],
      ),
    );
  }
  }
