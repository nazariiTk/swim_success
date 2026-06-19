import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_users.dart';
import 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final GetUsersUseCase getUsersUseCase;

  UsersCubit({required this.getUsersUseCase}) : super(const UsersState.initial());

  Future<void> fetchUsers() async {
    emit(const UsersState.loading());
    try {
      final users = await getUsersUseCase(const NoParams());
      emit(UsersState.success(
        users: users,
        filteredUsers: users,
      ));
    } catch (e) {
      emit(UsersState.error(e.toString()));
    }
  }

  void searchUsers(String query) {
    final currentState = state;
    if (currentState is UsersSuccess) {
      if (query.isEmpty) {
        emit(currentState.copyWith(
          filteredUsers: currentState.users,
          searchPrompt: '',
        ));
      } else {
        final filtered = currentState.users
            .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        emit(currentState.copyWith(
          filteredUsers: filtered,
          searchPrompt: query,
        ));
      }
    }
  }
}
