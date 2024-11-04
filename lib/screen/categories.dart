import'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/model/category.dart';
import'package:meals_app/model/meal.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key , required this.onToggleFavourite});

  final void Function(Meal meal) onToggleFavourite;

  void _selectCategory(BuildContext context , Category category){

    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealScreen(
          title: category.title,
          meals: filteredMeals,
        onToggleFavourite: onToggleFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(context){
  return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for(final category in availableCategories)
          CategoryGridItem(category: category , onSelectCategory: (){_selectCategory(context, category) ;} ),
      ],
    );
}

}