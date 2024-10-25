import 'package:flutter/material.dart';
import'package:meals_app/model/meal.dart';
import'package:transparent_image/transparent_image.dart';
import 'package:meals_app/widgets/meal_iteam_data.dart';

class MealItem extends StatelessWidget{
const MealItem({super.key , required this.meal});

  final Meal meal ;
@override
  Widget build(context){
    return Card(
      child: InkWell(
        onTap: (){},
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
              width : double.infinity ,
              height: 200,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(horizontal: 44 , vertical: 6 ),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12 ,),
                      Row(children: [
                        MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min')
                      ],)
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}