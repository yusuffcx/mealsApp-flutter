import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
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

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToogleMeal: toggleFavoriteMeal);
    var title = 'Categories';

    if (_pageIndex == 1) {
      activePage =
          MealsScreen(meals: favoriteMeals, onToggleMeal: toggleFavoriteMeal);
      title = 'Favorites';
    }

    return Scaffold(
      drawer: const MainDrawer(),
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
