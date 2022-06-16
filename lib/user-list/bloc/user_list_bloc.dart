import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:k11/entities/user.dart';
import 'package:k11/user-list/data/user_list_repository_iml.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserListRespositoryIml userListRespositoryIml;
  UserListBloc(this.userListRespositoryIml) : super(UserListState()) {
    on<GetUsers>(_getUsers);
    on<SaveUserLocal>(_saveUSersLocal);
  }

  _getUsers(GetUsers event, Emitter<UserListState> emit) async {
    // TODO: Simulacion de obtener datos del user
    emit(state.copyWith(status: UserListStatus.loading));
    try {
      final apiResults = await userListRespositoryIml.getUser();
      if (apiResults.data != null) {
        emit(state.copyWith(
            status: UserListStatus.success, users: apiResults.data));
      } else {
        emit(state.copyWith(
            status: UserListStatus.error, error: apiResults.message));
      }
    } catch (e) {
      emit(state.copyWith(status: UserListStatus.error, error: e.toString()));
    }
  }

  _saveUSersLocal(SaveUserLocal event, Emitter<UserListState> emit) async {
    // TODO: Simulacion de obtener datos del user
    emit(state.copyWith(status: UserListStatus.loading));
    try {
      final apiResults = await userListRespositoryIml.saveUsers(state.users!);
      if (apiResults.data != null) {
        event.function();
        emit(state.copyWith(
            status: UserListStatus.success, users: apiResults.data));
      } else {
        emit(state.copyWith(
            status: UserListStatus.error, error: apiResults.message));
      }
    } catch (e) {
      emit(state.copyWith(status: UserListStatus.error, error: e.toString()));
    }
  }
}
