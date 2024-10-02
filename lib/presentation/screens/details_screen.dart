import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/cubit/meals_cubit.dart';
import 'package:flutter_breaking/data/model/meal.dart';

class MealsDetailsScreen extends StatefulWidget {
  final String mealId;
  const MealsDetailsScreen({super.key, required this.mealId});
  
  @override
  State<StatefulWidget> createState() {
    return _MealsDetailsState();
  }
}

class _MealsDetailsState extends State<MealsDetailsScreen> {
  late Meal meal;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MealsCubit>(context).getMealDetails(widget.mealId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MealsCubit, MealsState>(
        builder: (context, state){
          if (state is MealDetailsLoading){
            return const Center(child: CircularProgressIndicator(),);
          } else if (state is MealDetailsLoaded) {
            meal = state.meal;
            return Column(
              children: [
                Image.network(meal.thumb)
              ],
            );
          } else {
            return Text('data');
          }
        }
        )
      // FutureBuilder(
      //   future: meal,
      //  builder: (context, snapshot){
      //   if (snapshot.connectionState == ConnectionState.waiting){
      //     return const Center(child: CircularProgressIndicator(),);
      //   } else if (snapshot.hasError){
      //     return Center(child: Text(snapshot.error.toString()),);
      //   } else if (snapshot.hasData) {
      //     Meal meal = snapshot.data!;
      //     return Column(
      //       children: [
      //         Image.network(meal.thumb),
      //         Text(meal.name)
      //       ]
      //     );
      //   } else {
      //       return const Center(child: Text('No data available'));
      //     }
      //  },
      //  )
    );
  }

}