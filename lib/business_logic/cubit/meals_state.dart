part of 'meals_cubit.dart';

class MealsState {
  final bool isLoading;
  final List<MealsByCategory> meals;
  final String? error;
  
  MealsState({
    this.isLoading = false,
    this.meals = const [],
    this.error,
  });
}
