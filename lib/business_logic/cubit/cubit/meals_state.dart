part of 'meals_cubit.dart';

@immutable
sealed class MealsState {}

final class MealsInitial extends MealsState {}
class MealsLoading extends MealsState {}
class MealsLoaded extends MealsState {
  final List<MealsByCategory> meals;
  MealsLoaded(this.meals);
}
class MealsError extends MealsState {
  final String message;
  MealsError(this.message);
}


class MealDetailsLoading extends MealsState {}
class MealDetailsLoaded extends MealsState {
  final Meal meal;
  MealDetailsLoaded(this.meal);
}
class MealDetailsError extends MealsState {
  final String message;
  MealDetailsError(this.message);
}
