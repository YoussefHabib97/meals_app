// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/constants/assets.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'package:meals_app/cubits/categories_cubit.dart';
import 'package:meals_app/views/widgets/categories_grid_view.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesInitial || state is CategoriesLoading) {
          return Skeletonizer(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Ink(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {},
                      child: GridTile(
                        footer: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Placeholder Text",
                            style: TextStyle(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        child: Image.asset(Assets.assetsSkeletonImage),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is CategoriesSuccess) {
          return CategoriesGridView(
            categories: BlocProvider.of<CategoriesCubit>(context).categories,
          );
        }
        return const Center(child: Text("An error has occured"));
      },
    );
  }
}
