import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saheel_machine_test/model/sub_category_model.dart';
import 'package:dio/dio.dart';
import 'package:saheel_machine_test/repository/subcategory_repository.dart';

// Events
abstract class SubcategoryEvent {}

class FetchSubCategories extends SubcategoryEvent {}

// States
abstract class SubcategoryState {}

class SubcategoryInitial extends SubcategoryState {}

class SubcategoryLoading extends SubcategoryState {}

class SubcategoryLoaded extends SubcategoryState {
  final List<SubCategoryModel> subCategories;

  SubcategoryLoaded(this.subCategories);
}

class SubcategoryError extends SubcategoryState {
  final String message;

  SubcategoryError(this.message);
}

// BLoC
class SubcategoryBloc extends Bloc<SubcategoryEvent, SubcategoryState> {
  final SubcategoryRepository repository;

  SubcategoryBloc(this.repository) : super(SubcategoryInitial()) {
    on<FetchSubCategories>((event, emit) async {
      emit(SubcategoryLoading());
      try {
        final subCategories = await repository.fetchSubCategory();
        emit(SubcategoryLoaded(subCategories));
      } on DioError catch (e) {
        emit(SubcategoryError(e.message ?? ""));
      } catch (e) {
        emit(SubcategoryError('Unexpected error: ${e.toString()}'));
      }
    });
  }
}
