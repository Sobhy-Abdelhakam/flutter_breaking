import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/app_router.dart';
import 'package:flutter_breaking/business_logic/cubit/cubit/meals_cubit.dart';
import 'package:flutter_breaking/data/api_service/meals_service.dart';
import 'package:flutter_breaking/data/repository/meals_repository.dart';

void main() {
  runApp(CheckenMealsApp(
    appRouter: AppRouter(),
  ));
}

class CheckenMealsApp extends StatelessWidget {
  final AppRouter appRouter;

  const CheckenMealsApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealsCubit(MealsRepository(MealsService())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
