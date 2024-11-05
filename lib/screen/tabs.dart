import 'package:flutter/material.dart';
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

  void _showInfoMessage(String message){

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavouriteStatus(Meal meal){
    final isExisting = _favouriteMeals.contains(meal);

    if(isExisting){
      setState(() {
        _favouriteMeals.remove(meal);
        _showInfoMessage('removed from favourite');
      });
    }
    else{
     setState(() {
       _favouriteMeals.add(meal);
       _showInfoMessage('added to favourite');
     });
    }
  }


  void _selectPage (int index){
    setState(() {
      _selectedPageIndex= index ;
    });
  }

  @override
    Widget build(context){
    Widget activePage = CategoriesScreen(onToggleFavourite:  _toggleMealFavouriteStatus,);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage =  MealScreen(meals: _favouriteMeals ,
      onToggleFavourite: _toggleMealFavouriteStatus,
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
