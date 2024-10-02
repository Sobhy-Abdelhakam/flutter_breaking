import 'package:flutter_breaking/data/api_service/meals_service.dart';
import 'package:flutter_breaking/data/model/meal.dart';
import 'package:flutter_breaking/data/model/meals_by_category.dart';

class MealsRepository {
  final MealsService _mealsService;

  MealsRepository(this._mealsService);

  Future<List<MealsByCategory>> getMeals() async {
    final meals = await _mealsService.getMeals();
    return meals;
  }

  Future<Meal> getMealDetails(String mealId) async {
    final meal = await _mealsService.getMeal(mealId);
    return meal;
  }
}
