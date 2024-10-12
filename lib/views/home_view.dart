// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'package:meals_app/cubits/categories_cubit.dart';

// Project imports:

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<CategoriesCubit>(context);
          return switch (state) {
            CategoriesInitial() || CategoriesLoading() => Skeletonizer(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return const GridTile(
                      child: Center(child: Text("Lorem Ipsum 7otty Kalamon")),
                    );
                  },
                ),
              ),
            CategoriesSuccess() => RefreshIndicator(
                onRefresh: () async {
                  await cubit.getCategories();
                },
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: cubit.categories.length,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: GridTile(
                        child: Center(
                          child: Text("Lorem Ipsum 7otty Kalamon"),
                        ),
                      ),
                    );
                  },
                ),
              ),
            CategoriesFailure() => const Center(
                child: Text("An error has occurred, please try again later"),
              ),
          };
        },
      ),
    );
  }
}
