import 'package:bloc_games/repository/models/game.dart';
import 'package:bloc_games/repository/models/genre.dart';
import 'package:bloc_games/repository/models/result.dart';
import 'package:bloc_games/repository/service/game_service.dart';

class GameRepository {
  const GameRepository({
    required this.service,
  });

  final GameService service;

  Future<Game> getGames() async => service.getGames();

  Future<List<Genre>> getGenres() async => service.getGenres();

  Future<List<Result>> getGamesByCategory(int genreId) async => service.getGamesByCategory(genreId);
}
