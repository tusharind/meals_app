import 'package:flutter/material.dart';
import 'package:insta/models/meal.dart';

class mealDetailsScreen extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;

  const mealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavourite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavourite(meal);
              },
              icon: const Icon(
                Icons.star,
              )),
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            meal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 14),
          Center(
            child: Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 14),
          for (final ingredient in meal.ingredients)
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(ingredient),
            )),
          const SizedBox(height: 14),
          Center(
            child: Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 14),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                step,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
