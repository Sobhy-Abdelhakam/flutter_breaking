class Meal {
  late String id;
  late String name;
  late String instructions;
  late String thumb;

  Meal.fromJson(Map<String, dynamic> json){
    id = json['idMeal'];
    name = json['strMeal'];
    instructions = json['strInstructions'];
    thumb = json['strMealThumb'];
  }
}