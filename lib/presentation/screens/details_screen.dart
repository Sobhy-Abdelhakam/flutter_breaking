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
        body: BlocBuilder<MealsCubit, MealsState>(builder: (context, state) {
      if (state is MealDetailsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is MealDetailsLoaded) {
        meal = state.meal;
        return CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: 500,
            pinned: true,
            // stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(meal.name),
              background: Image.network(
                meal.thumb,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const Column(
              children: [
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
              ],
            )
          ]))
        ]);
      } else if(state is MealsError){
        final message = state.message;
        return Center(child: Text(message));
      } else {
        return const Center(child: Text('List of meals is empty'));
      }
    })
        );
  }
}
