part of 'get_categories_bloc_bloc.dart';

sealed class GetCategoriesBlocState extends Equatable {
  const GetCategoriesBlocState();
  
  @override
  List<Object> get props => [];
}

final class GetCategoriesBlocInitial extends GetCategoriesBlocState {}

final class GetCategoriesBlocFailure extends GetCategoriesBlocState {}
final class GetCategoriesBlocLoading extends GetCategoriesBlocState {}
final class GetCategoriesBlocSuccess extends GetCategoriesBlocState {
  final List<Category> categories;

  const GetCategoriesBlocSuccess(this.categories);

  @override
  List<Object> get props => [];
}

