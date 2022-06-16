part of 'user_list_bloc.dart';

abstract class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object> get props => [];
}

class GetUsers extends UserListEvent {}

class SaveUserLocal extends UserListEvent {
  final Function function;

  const SaveUserLocal(this.function);
}
