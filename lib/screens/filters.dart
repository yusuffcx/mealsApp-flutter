import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

var _setGlutenFree = false;
var _setLactoseFree = false;
var _setVegetarian = false;
var _setVegan = false;

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _setGlutenFree,
            Filter.lactoseFree: _setLactoseFree,
            Filter.vegan: _setVegan,
            Filter.vegetarian: _setVegetarian
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _setGlutenFree,
              onChanged: (isChecked) {
                setState(() {
                  _setGlutenFree = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text('Only include gluten-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            ),
            SwitchListTile(
              value: _setLactoseFree,
              onChanged: (isChecked) {
                setState(() {
                  _setLactoseFree = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text('Only include lactose-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            ),
            SwitchListTile(
              value: _setVegetarian,
              onChanged: (isChecked) {
                setState(() {
                  _setVegetarian = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text('Only include vegetarian meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            ),
            SwitchListTile(
              value: _setVegan,
              onChanged: (isChecked) {
                setState(() {
                  _setVegan = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text('Only include vegan meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
