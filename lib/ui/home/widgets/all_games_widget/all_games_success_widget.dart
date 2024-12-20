import 'package:bloc_games/repository/models/result.dart';
import 'package:bloc_games/ui/home/widgets/all_games_widget/all_games_item.dart';
import 'package:flutter/material.dart';


class AllGamesSuccessWidget extends StatelessWidget {
  const AllGamesSuccessWidget({
    Key? key,
    required this.games,
    required this.title,
  }) : super(key: key);

  final List<Result> games;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        Container(
          height:
          ((100 * games.length) + MediaQuery.of(context).size.width) + 24.0,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 12.0,
            ),
            itemBuilder: (context, index) {
              return AllGamesItem(
                game: games[index],
              );
            },
            separatorBuilder: (_, __) => SizedBox(
              height: 12.0,
            ),
            itemCount: games.length,
          ),
        ),
      ],
    );
  }
}
