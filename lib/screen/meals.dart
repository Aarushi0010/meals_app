import 'package:flutter/material.dart';
// import 'package:meals_app/data/dummy_data.dart';
// import 'package:meals_app/main.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/meal_detail.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealScreen extends StatelessWidget{
  const MealScreen({super.key, this.title , required this.meals , required this.onToggleFavourite});

  final String? title ;
  final List<Meal> meals ;
  final void Function(Meal meal) onToggleFavourite;

  void selectMeal(BuildContext context , Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealDetailScreen(
        meal: meal ,
      onToggleFavourite: onToggleFavourite,
    )));
  }

  @override
  Widget build(context){
    Widget content  =  ListView.builder(
      itemCount: meals.length,
        // itemBuilder: (ctx, index) => Text(meals[index].title));
        itemBuilder: (ctx, index) => MealItem(meal: meals[index], onSelectMeal: (meal){
          selectMeal(context, meal);
        },));

        if(meals.isEmpty){
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('uh oh.....Nothing to see here',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(height: 16),
            Text('Try selecting a different category' ,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ],

        ),
      );
    }

        if (title == null){
          return content ;
        }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body:content,
    );
  }

}