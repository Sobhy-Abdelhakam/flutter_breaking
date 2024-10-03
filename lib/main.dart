import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/app_router.dart';
import 'package:flutter_breaking/business_logic/cubit/meal_details_cubit.dart';
import 'package:flutter_breaking/business_logic/cubit/meals_cubit.dart';
import 'package:flutter_breaking/data/api_service/meals_service.dart';
import 'package:flutter_breaking/data/repository/meals_repository.dart';

void main() {
  final MealsService mealsService = MealsService();
  final MealsRepository mealsRepository = MealsRepository(mealsService);
  runApp(CheckenMealsApp(
    appRouter: AppRouter(),
    mealsRepository: mealsRepository,
  ));
}

class CheckenMealsApp extends StatelessWidget {
  final AppRouter appRouter;
  final MealsRepository mealsRepository;

  const CheckenMealsApp(
      {super.key, required this.appRouter, required this.mealsRepository});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MealsCubit(mealsRepository)..getAllMeals(),
        ),
        BlocProvider(
          create: (_) => MealDetailsCubit(mealsRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
