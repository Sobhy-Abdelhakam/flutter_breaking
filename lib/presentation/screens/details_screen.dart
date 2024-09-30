import 'package:flutter/material.dart';
import 'package:flutter_breaking/data/api_service/meals_service.dart';
import 'package:flutter_breaking/data/model/meal.dart';

class MealsDetailsScreen extends StatefulWidget {
  final mealId;
  const MealsDetailsScreen({super.key, required this.mealId});
  
  @override
  State<StatefulWidget> createState() {
    return _MealsDetailsState();
  }
}

class _MealsDetailsState extends State<MealsDetailsScreen> {
  late Future<Meal> meal;
  @override
  void initState() {
    super.initState();
    meal = MealsService().getMeal(widget.mealId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Details'),
      ),
      body: FutureBuilder(
        future: meal,
       builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        } else if (snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()),);
        } else if (snapshot.hasData) {
          Meal meal = snapshot.data!;
          return Column(
            children: [
              Image.network(meal.thumb),
              Text(meal.name)
            ]
          );
        } else {
            return const Center(child: Text('No data available'));
          }
       },
       )
    );
  }

}