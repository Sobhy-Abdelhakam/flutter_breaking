import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/data/model/meals_by_category.dart';
import 'package:flutter_breaking/data/repository/meals_repository.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  final MealsRepository _mealsRepository;

  MealsCubit(this._mealsRepository) : super(MealsState());

  getAllMeals() {
    emit(MealsState(isLoading: true));
    try {
      _mealsRepository.getMeals().then(
      (meals) {
        emit(MealsState(isLoading: false, meals: meals));
      },
    );
    } catch (e) {
      emit(MealsState(isLoading: false, error: e.toString()));
    }
    
  }
}
