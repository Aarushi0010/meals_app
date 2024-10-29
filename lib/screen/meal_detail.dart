import'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';

class MealDetailScreen extends StatelessWidget{
const MealDetailScreen({super.key , required this.meal});

  final Meal meal ;

  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height:300,
            ),
        
            const SizedBox(height: 12,),
            Text('Ingredients' , style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),),
        
            const SizedBox(height: 14,),
            for(final ingredient in meal.ingredients)
              Text(ingredient,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
        
            const SizedBox(height: 20),
            Text('Steps' , style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),),
        
            const SizedBox(height: 14,),
            for(final step in meal.steps)
              Text(step,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
          ],
        ),
      ),
    );
  }
}