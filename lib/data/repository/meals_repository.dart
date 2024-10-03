import 'package:flutter_breaking/data/api_service/meals_service.dart';
import 'package:flutter_breaking/data/model/meal.dart';
import 'package:flutter_breaking/data/model/meals_by_category.dart';

class MealsRepository {
  final MealsService _mealsService;

  MealsRepository(this._mealsService);

  Future<List<MealsByCategory>> getMeals() {
    return _mealsService.getMeals();
  }

  Future<Meal> getMealDetails(String mealId) {
    return _mealsService.getMeal(mealId);
  }
}
