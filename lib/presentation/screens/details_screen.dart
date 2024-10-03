import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/meal_details_cubit.dart';
import 'package:flutter_breaking/business_logic/cubit/meal_details_state.dart';

class MealsDetailsScreen extends StatefulWidget {
  final String mealId;
  const MealsDetailsScreen({super.key, required this.mealId});

  @override
  State<StatefulWidget> createState() {
    return _MealsDetailsState();
  }
}

class _MealsDetailsState extends State<MealsDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MealDetailsCubit>(context).getMealDetails(widget.mealId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MealDetailsCubit, MealDetailsState>(
        builder: (context, state) {
          if (state is MealDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MealDetailsLoaded) {
            final meal = state.meal;
            return CustomScrollView(
              slivers: [
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
                  delegate: SliverChildListDelegate(
                    [
                      Column(
                        children: [
                          Text(meal.instructions),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                          const Text('data'),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          } else if (state is MealDetailsError) {
            final message = state.message;
            return Center(child: Text(message));
          }
          return const Center(child: Text('No details found'));
        },
      ),
    );
  }
}
