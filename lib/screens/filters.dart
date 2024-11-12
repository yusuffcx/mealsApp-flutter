import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});
  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _setGlutenFree = false;
  var _setLactoseFree = false;
  var _setVegetarian = false;
  var _setVegan = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _setGlutenFree = activeFilters[Filter.glutenFree]!;
    _setLactoseFree = activeFilters[Filter.lactoseFree]!;
    _setVegetarian = activeFilters[Filter.vegetarian]!;
    _setVegan = activeFilters[Filter.vegan]!;
    print("initState $activeFilters");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: PopScope(
        //canPop: true,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          ref.read(filtersProvider.notifier).setFilters({
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
