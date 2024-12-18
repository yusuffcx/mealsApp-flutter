import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var _pageIndex = 0;

  void changePage(index) {
    setState(() {
      _pageIndex = index;
    });
  }

  void selectedItem(String itemName) async {
    Navigator.of(context).pop();

    if (itemName == 'Meals') {
    } else {
      await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (context) => const FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = ref.watch(filteredMealsProvider);
    Widget activePage = CategoriesScreen(filteredMeals: filteredMeals);
    var title = 'Categories';

    if (_pageIndex == 1) {
      final favMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(meals: favMeals);
      title = 'Favorites';
    }

    return Scaffold(
      drawer: MainDrawer(onSelectItem: selectedItem),
      body: activePage,
      appBar: AppBar(
        title: Text(title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
        onTap: changePage,
      ),
    );
  }
}
