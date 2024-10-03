import 'package:flutter_breaking/data/model/meal.dart';

abstract class MealDetailsState {}
class MealDetailsInitial extends MealDetailsState {}

class MealDetailsLoading extends MealDetailsState {}
class MealDetailsLoaded extends MealDetailsState {
  final Meal meal;
  MealDetailsLoaded(this.meal);
}
class MealDetailsError extends MealDetailsState {
  final String message;
  MealDetailsError(this.message);
}