import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/cubit/meals_cubit.dart';
import 'package:flutter_breaking/constants/strings.dart';
import 'package:flutter_breaking/data/model/meals_by_category.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MealsState();
  }
}

class _MealsState extends State<MealsScreen> {
  late List<MealsByCategory> allMeals;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MealsCubit>(context).getAllMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals List'),
      ),
      body: BlocBuilder<MealsCubit, MealsState>(
        builder: (context, state) {
          if (state is MealsLoaded) {
            allMeals = state.meals;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 2 / 3),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: allMeals.length,
              itemBuilder: (context, index) {
                final meal = allMeals[index];
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, mealDetailsScreen, arguments: meal.mealId);
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
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
