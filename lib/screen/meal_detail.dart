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
      body: Image.network(meal.imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
        height:300,
      ),
    );
  }
}