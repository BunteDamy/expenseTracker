import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

part 'get_categories_bloc_event.dart';
part 'get_categories_bloc_state.dart';

class GetCategoriesBlocBloc extends Bloc<GetCategoriesBlocEvent, GetCategoriesBlocState> {
  ExpenseRepository expenseRepository;

  GetCategoriesBlocBloc(this.expenseRepository) : super(GetCategoriesBlocInitial()) {
    on<GetCategories>((event, emit) async {
      emit(GetCategoriesBlocLoading());
      try {
        List<Category> categories = await expenseRepository.getCategory();
        emit(GetCategoriesBlocSuccess(categories));
      } catch (e) {
        emit(GetCategoriesBlocFailure());
      }
    });
  }
}
