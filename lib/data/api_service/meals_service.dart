import 'package:dio/dio.dart';
import 'package:flutter_breaking/constants/strings.dart';
import 'package:flutter_breaking/data/model/meal.dart';
import 'package:flutter_breaking/data/model/meals_by_category.dart';

class MealsService {
  late Dio dio;

  MealsService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<MealsByCategory>> getMeals() async {
    Response response = await dio.get('filter.php?c=Chicken');
    if (response.statusCode == 200) {
      List mealsJson = response.data['meals'];
      return mealsJson.map((meal) => MealsByCategory.fromJson(meal)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<Meal> getMeal(String mealId) async {
    Response response = await dio.get(
      'lookup.php',
      queryParameters: {'i': mealId},
    );
    if (response.statusCode == 200) {
      List mealResponse = response.data['meals'];
      return mealResponse.map((meal) => Meal.fromJson(meal)).toList().first;
    } else {
      throw Exception('Failed to load meal');
    }
  }
}
