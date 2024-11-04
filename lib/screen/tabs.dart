import'package:flutter/material.dart';
import 'package:meals_app/screen/meals.dart';
import 'categories.dart';
import 'package:meals_app/model/meal.dart';
class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }

}

  class _TabScreenState extends State<TabScreen>{

  int _selectedPageIndex = 0 ;

  final List<Meal> _favouriteMeals = [];

  void _toogleMealFavouriteStatus(Meal meal){
    final isExisting = _favouriteMeals.contains(meal);

    if(isExisting){
      _favouriteMeals.remove(meal);
    }
    else{
      _favouriteMeals.add(meal);
    }
  }


  void _selectPage (int index){
    setState(() {
      _selectedPageIndex= index ;
    });
  }

  @override
    Widget build(context){
    Widget activePage = CategoriesScreen(onToggleFavourite:  _toogleMealFavouriteStatus,);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage =  MealScreen(meals: [] ,
      onToggleFavourite: _toogleMealFavouriteStatus, 
      );
      activePageTitle = 'Your Favourites';
    }
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
