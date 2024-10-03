part of 'meals_cubit.dart';

abstract class MealsState {}

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
