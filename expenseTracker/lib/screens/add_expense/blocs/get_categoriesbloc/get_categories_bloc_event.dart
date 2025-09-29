part of 'get_categories_bloc_bloc.dart';

sealed class GetCategoriesBlocEvent extends Equatable {
  const GetCategoriesBlocEvent();

  @override
  List<Object> get props => [];
}

class GetCategories extends GetCategoriesBlocEvent {}
