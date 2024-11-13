import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screen/filter_screen.dart';
import 'package:meals_app/screen/meals.dart';
import 'categories.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters  = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

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
  Map<Filter , bool> _selectedFilters = kInitialFilters ;

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

  void _setScreen (String identifier) async{
    Navigator.of(context).pop();
    if(identifier == 'filters'){
      final result = await Navigator.of(context).push<Map<Filter, bool>>
          (MaterialPageRoute(builder: (ctx) => FilterScreen(currentFilter: _selectedFilters,)));

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });

    }
  }

  @override
    Widget build(context){

    final availableMeals = dummyMeals.where((meal) {
      if(_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false ;
      } ;
      if(_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false ;
      };
      if(_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false ;
      };
      if(_selectedFilters[Filter.vegan]! && !meal.isVegan){
        return false ;
      }
      return true ;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavourite: _toggleMealFavouriteStatus,
      availableMeals: availableMeals,
    );
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
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
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
