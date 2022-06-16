part of 'user_list_bloc.dart';

enum UserListStatus { initial, success, error, loading }

extension UserListStatusX on UserListStatus {
  bool get isInitial => this == UserListStatus.initial;
  bool get isSuccess => this == UserListStatus.success;
  bool get isError => this == UserListStatus.error;
  bool get isLoading => this == UserListStatus.loading;
}

class UserListState extends Equatable {
  UserListState({
    this.status = UserListStatus.initial,
    List<User>? users,
    this.error = '',
  }) : users = users ?? [];

  final UserListStatus status;
  final String error;
  final List<User>? users;
  //list users

  UserListState copyWith(
          {UserListStatus? status, String? error, List<User>? users}) =>
      UserListState(
          status: status ?? this.status,
          error: error ?? this.error,
          users: users ?? this.users);

  @override
  List<Object?> get props => [status, error, users];
}
