import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = UsersInitial;
  const factory UsersState.loading() = UsersLoading;
  const factory UsersState.success({
    required List<User> users,
    required List<User> filteredUsers,
    @Default('') String searchPrompt,
  }) = UsersSuccess;
  const factory UsersState.error(String message) = UsersError;
}
