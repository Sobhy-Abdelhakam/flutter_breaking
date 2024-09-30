import 'package:flutter/material.dart';
import 'package:flutter_breaking/constants/strings.dart';
import 'package:flutter_breaking/presentation/screens/details_screen.dart';
import 'package:flutter_breaking/presentation/screens/meals_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case mealsScreen:
        return MaterialPageRoute(builder: (_) => const MealsScreen());
      // case mealDetailsScreen:
      //   return MaterialPageRoute(builder: (_) => const MealsDetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}