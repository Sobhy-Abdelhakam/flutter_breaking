import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/meals_cubit.dart';
import 'package:flutter_breaking/constants/strings.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals List'),
      ),
      body: BlocBuilder<MealsCubit, MealsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.meals.isNotEmpty) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 2 / 3),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.meals.length,
              itemBuilder: (context, index) {
                final meal = state.meals[index];
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, mealDetailsScreen,
                          arguments: meal.mealId);
                    },
                    child: GridTile(
                      footer: Container(
                        width: double.infinity,
                        color: Colors.black54,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          meal.mealName,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      child: Container(
                        color: Colors.grey,
                        child: FadeInImage.assetNetwork(
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: 'assets/images/loader_animation.gif',
                          image: meal.mealThumb,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state.error != null) {
            final message = state.error;
            return Center(
              child: Text(message!),
            );
          }
          return const Center(
            child: Text('No Data found'),
          );
        },
      ),
    );
  } 
}