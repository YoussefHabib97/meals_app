// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'package:meals_app/cubits/categories_cubit.dart';

// Project imports:

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});
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
          if (state is CategoriesInitial || state is CategoriesLoading) {
            return Skeletonizer(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Center(
                    child: GridTile(
                      child: Text("Placeholder Text"),
                    ),
                  );
                },
              ),
            );
          } else if (state is CategoriesSuccess) {
            return RefreshIndicator.adaptive(
              onRefresh: () async {
                await BlocProvider.of<CategoriesCubit>(context).getCategories();
              },
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount:
                    BlocProvider.of<CategoriesCubit>(context).categories.length,
                itemBuilder: (context, index) {
                  return const Center(
                    child: GridTile(
                      child: Text("Placeholder Text"),
                    ),
                  );
                },
              ),
            );
          }
          return const Center(child: Text("An error has occured"));
        },
      ),
    );
  }
}
