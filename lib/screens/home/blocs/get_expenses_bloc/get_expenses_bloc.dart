import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

part 'get_expenses_event.dart';
part 'get_expenses_state.dart';

class GetExpensesBloc extends Bloc<GetExpensesEvent, GetExpensesState> {
  ExpenseRepository expenseRepository;

  GetExpensesBloc(this.expenseRepository) : super(GetExpensesInitial()) {
    on<GetExpensesEvent>((event, emit)async {
      emit(GetExpensesLoading());
      try {
        List<Expense> expenses = await expenseRepository.getExpense();
      } catch (e) {
        emit(GetExpensesFailure());
      }
    });
  }
}
