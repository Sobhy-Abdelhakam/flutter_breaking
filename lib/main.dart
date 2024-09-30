import 'package:flutter/material.dart';
import 'package:flutter_breaking/app_router.dart';

void main() {
  runApp(CheckenMealsApp(appRouter: AppRouter(),));
}

class CheckenMealsApp extends StatelessWidget {
  final AppRouter appRouter;

  const CheckenMealsApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}