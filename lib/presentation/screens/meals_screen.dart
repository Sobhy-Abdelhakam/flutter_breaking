import 'package:flutter/material.dart';
import 'package:flutter_breaking/data/api_service/meals_service.dart';
import 'package:flutter_breaking/data/model/meals_by_category.dart';



class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _MealsState();
  }
  
}

class _MealsState extends State<MealsScreen> {
  late Future<List<MealsByCategory>> _mealsFuture;
  @override
  void initState() {
    super.initState();
    _mealsFuture = MealsService().getMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals List'),
      ),
      body: FutureBuilder<List<MealsByCategory>>(
        future: _mealsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<MealsByCategory> meals = snapshot.data!;
            return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return ListTile(
                  leading: Image.network(meal.mealThumb),
                  title: Text(meal.mealName),
                  subtitle: Text('Meal ID: ${meal.mealId}'),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

}