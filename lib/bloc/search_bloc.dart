import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saheel_machine_test/model/search_model.dart';
import 'package:saheel_machine_test/repository/search_repository.dart';

// Events
abstract class SearchEvent {}

class SearchDishes extends SearchEvent {
  final String query;

  SearchDishes(this.query);
}

// States
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  SearchModel searchResults;

  SearchLoaded(this.searchResults);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}

// BLoC
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;

  SearchBloc(this.repository) : super(SearchInitial()) {
    on<SearchDishes>((event, emit) async {
      emit(SearchLoading());
      try {
        final searchResults = await repository.fetchSearch(event.query);
        emit(SearchLoaded(searchResults));
      } catch (e) {
        emit(SearchError('Error: ${e.toString()}'));
      }
    });
  }
}
