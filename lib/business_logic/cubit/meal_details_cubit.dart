import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/meal_details_state.dart';
import 'package:flutter_breaking/data/repository/meals_repository.dart';

class MealDetailsCubit extends Cubit<MealDetailsState> {
  final MealsRepository _mealsRepository;
  MealDetailsCubit(this._mealsRepository) : super(MealDetailsInitial());

  getMealDetails(String mealId) {
    emit(MealDetailsLoading());
    try {
      _mealsRepository.getMealDetails(mealId).then(
      (meal){
        emit(MealDetailsLoaded(meal));
    },
    );
    } catch (e) {
      emit(MealDetailsError(e.toString()));
    }
    
  }

}