import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/data/model/meal.dart';
import 'package:flutter_breaking/data/model/meals_by_category.dart';
import 'package:flutter_breaking/data/repository/meals_repository.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  final MealsRepository _mealsRepository;

  MealsCubit(this._mealsRepository) : super(MealsInitial());

  static MealsCubit get(context) => BlocProvider.of(context);

  getAllMeals() {
    _mealsRepository.getMeals().then(
      (meals) {
        emit(MealsLoaded(meals));
      },
    );
  }
  getMealDetails(String mealId) {
    _mealsRepository.getMealDetails(mealId).then(
      (meal){
        emit(MealDetailsLoaded(meal));
    },
    );
  }
}
