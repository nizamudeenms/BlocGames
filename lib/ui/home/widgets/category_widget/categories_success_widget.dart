import 'package:bloc_games/repository/models/genre.dart';
import 'package:bloc_games/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:bloc_games/ui/home/widgets/category_widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesSuccessWidget extends StatelessWidget {
  const CategoriesSuccessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.status.isLoading
            ? ShimmerCircle(context)
            : SizedBox(
                height: MediaQuery.of(context).size.height * .15,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      key: ValueKey('${state.categories[index].name}$index'),
                      category: state.categories[index],
                      callback: (Genre categorySelected) {
                        // context.read<GamesByCategoryBloc>().add(
                        //   GetGamesByCategory(
                        //     idSelected: categorySelected.id,
                        //     categoryName: categorySelected.name ?? '',
                        //   ),
                        // );
                        context.read<CategoryBloc>().add(
                              SelectCategory(
                                idSelected: categorySelected.id,
                              ),
                            );
                      },
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: 16.0,
                  ),
                  itemCount: state.categories.length,
                ),
              );
      },
    );
  }

  Widget ShimmerCircle(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Container(
                height: 60.0, // Matching the height of the selected CategoryItem
                width: 60.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 16.0),
        itemCount: 5, // Display 3 shimmer items as placeholders
      ),
    );
  }
}
