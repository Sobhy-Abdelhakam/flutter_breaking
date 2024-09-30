class MealsByCategory {
  late String mealName;
  late String mealThumb;
  late String mealId;

  MealsByCategory.fromJson(Map<String, dynamic> json){
    mealName = json['strMeal'];
    mealThumb = json['strMealThumb'];
    mealId = json['idMeal'];
  }
}