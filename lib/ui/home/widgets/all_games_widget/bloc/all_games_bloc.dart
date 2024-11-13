import 'package:bloc_games/repository/game_repository.dart';
import 'package:bloc_games/repository/models/model_barrel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'all_games_event.dart';
part 'all_games_state.dart';

class AllGamesBloc extends Bloc<AllGamesEvent, AllGamesState> {
  AllGamesBloc({
    required this.gameRepository,
  }) : super(AllGamesState()) {
    on<GetGames>(_mapGetGamesEventToState);
  }

  final GameRepository gameRepository;

  void _mapGetGamesEventToState(
      GetGames event, Emitter<AllGamesState> emit) async {
    try {

      emit(state.copyWith(status: AllGamesStatus.loading));
      final games = await gameRepository.getGames();
      emit(
        state.copyWith(
          status: AllGamesStatus.success,
          games: games,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: AllGamesStatus.error));
    }
  }
}
