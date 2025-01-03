import'package:flutter/material.dart';
// import 'package:meals_app/widgets/main_drawer.dart';
// import 'package:meals_app/screen/tabs.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key , required this.currentFilter});

  final Map<Filter , bool> currentFilter ;
  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

  class _FilterScreenState extends State<FilterScreen>{

  var _glutenFreeFilterSet = false ;
  var _lactoseFreeFilterSet = false ;
  var _vegetarianFilterSet = false ;
  var _veganFilterSet = false ;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilter[Filter.glutenFree]! ;
    _lactoseFreeFilterSet = widget.currentFilter[Filter.lactoseFree]! ;
    _vegetarianFilterSet = widget.currentFilter[Filter.vegetarian]! ;
    _veganFilterSet = widget.currentFilter[Filter.vegan]! ;
  }

  @override
    Widget build(context){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        // drawer: MainDrawer(
        //   onSelectScreen: (identifier){
        //     Navigator.of(context).pop();
        //     if(identifier=='meals'){
        //       Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const TabScreen()));
        //     }
        //   },
        // ),
        body: WillPopScope(
          onWillPop: () async {

            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactoseFreeFilterSet,
              Filter.vegetarian: _vegetarianFilterSet,
              Filter.vegan: _veganFilterSet,
            });
            return false  ;
          },
          child: Column(
            children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-Free' ,
                style : Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
                subtitle: Text(
                  'only include gluten-free meals',
                  style : Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left : 34 , right : 22),
              ),
              SwitchListTile(
                value: _lactoseFreeFilterSet,
                onChanged: (isChecked){
                  setState(() {
                    _lactoseFreeFilterSet= isChecked;
                  });
                },
                title: Text(
                  'Lactose-Free' ,
                  style : Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                subtitle: Text(
                  'only include Lactose-free meals',
                  style : Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left : 34 , right : 22),
              ),
              SwitchListTile(
                value: _vegetarianFilterSet,
                onChanged: (isChecked){
                  setState(() {
                    _vegetarianFilterSet= isChecked;
                  });
                },
                title: Text(
                  'Vegetarian' ,
                  style : Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                subtitle: Text(
                  'only include vegetarian meals',
                  style : Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left : 34 , right : 22),
              ),
              SwitchListTile(
                value: _veganFilterSet,
                onChanged: (isChecked){
                  setState(() {
                    _veganFilterSet= isChecked;
                  });
                },
                title: Text(
                  'Vegan' ,
                  style : Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                subtitle: Text(
                  'only include Vegan meals',
                  style : Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left : 34 , right : 22),
              ),
            ],
          
          ),
        ),
      );
  }
  }
