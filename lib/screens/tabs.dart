import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> favoriteMeals = [];

  Map<Filter, bool> _selectedFilters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegan: false,
    Filter.vegetarian: false
  };
  var _pageIndex = 0;

  void _showMessage(message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message, style: const TextStyle(fontSize: 16))));
  }

  void toggleFavoriteMeal(Meal meal) {
    var isExist = favoriteMeals.contains(meal);
    setState(() {
      if (isExist) {
        favoriteMeals.remove(meal);
        _showMessage("The meal has been removed from favorites");
      } else {
        favoriteMeals.add(meal);
        _showMessage("The meal has been added to favorites");
      }
    });
  }

  void changePage(index) {
    setState(() {
      _pageIndex = index;
    });
  }

  void selectedItem(String itemName) async {
    Navigator.of(context).pop();

    if (itemName == 'Meals') {
    } else {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (context) => const FiltersScreen()));
      setState(() {
        _selectedFilters = result!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var filteredMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
        onToogleMeal: toggleFavoriteMeal, filteredMeals: filteredMeals);
    var title = 'Categories';

    if (_pageIndex == 1) {
      activePage =
          MealsScreen(meals: favoriteMeals, onToggleMeal: toggleFavoriteMeal);
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
