import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

var _setGlutenFree = false;

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: SwitchListTile(
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
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface)),
        contentPadding: const EdgeInsets.only(left: 32, right: 22),
      ),
    );
  }
}
