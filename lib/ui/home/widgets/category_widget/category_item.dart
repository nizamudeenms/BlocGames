import 'package:bloc_games/repository/models/genre.dart';
import 'package:bloc_games/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef CategoryCLicked = Function(Genre categorySelected);

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
    required this.callback,
  }) : super(key: key);

  final Genre category;
  final CategoryCLicked callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(category),
      child: BlocSelector<CategoryBloc, CategoryState, bool>(
        selector: (state) => (state.status.isSelected && state.idSelected == category.id) ? true : false,
        builder: (context, state) {
          return Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOutCirc,
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                alignment: Alignment.center,
                height: state ? 70.0 : 60.0,
                width: state ? 70.0 : 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: state ? Colors.deepOrangeAccent : Colors.amberAccent,
                ),
                child: const Icon(
                  Icons.gamepad_outlined,
                ),
              ),
              SizedBox(height: 4.0),
              Container(
                width: 60,
                child: Text(
                  category.name ?? '',
                  style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.black87),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
