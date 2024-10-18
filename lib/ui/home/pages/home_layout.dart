import 'package:bloc_games/ui/home/widgets/category_widget/categories_widget.dart';
import 'package:bloc_games/ui/home/widgets/header_title/header_title.dart';
import 'package:bloc_games/ui/widgets/container_body.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(),
          SizedBox(height: 40.0),
          ContainerBody(
            children: [
              CategoriesWidget(),
              // GamesByCategoryWidget(),
              // AllGamesWidget(title: 'All games'),
            ],
          )
        ],
      ),
    );
  }
}
