import 'package:insta/models/ct.dart';
import 'package:flutter/material.dart';
import 'package:insta/data/dummy_data.dart';
import 'package:insta/models/meal.dart';
import 'package:insta/screens/meals.dart';
import 'package:insta/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  final void Function(Meal meal) onToggleFavourite;
  final List<Meal> availableMeals;

  CategoryScreen(
      {super.key,
      required this.onToggleFavourite,
      required this.availableMeals});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavourite: onToggleFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(18),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories
          .map((cat) => CategoryGridItem(
                category: cat,
                onSelectCategory: () {
                  _selectCategory(context, cat); // Pass current category
                },
              ))
          .toList(),
    );
  }
}
