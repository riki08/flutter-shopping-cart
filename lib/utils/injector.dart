import 'package:injector/injector.dart';
import 'package:k11/home/bloc/home_bloc.dart';
import 'package:k11/home/data/home_repository_iml.dart';
import 'package:k11/home/repository/home_repository.dart';
import 'package:k11/user-list/bloc/user_list_bloc.dart';
import 'package:k11/user-list/data/user_list_repository_iml.dart';
import 'package:k11/user-list/repository/user_list_repository.dart';
import 'package:k11/utils/api_helper.dart';

class Dependencies {
  final injector = Injector.appInstance;

  blocsRegister() {
    injector.registerSingleton<HomeBloc>(
        () => HomeBloc(injector.get<HomeRepositoryIml>()));
    injector.registerSingleton<UserListBloc>(
        () => UserListBloc(injector.get<UserListRespositoryIml>()));
  }

  repositoryRegister() {
    injector.registerSingleton<ApiBaseHelper>(() => ApiBaseHelper());
    injector.registerDependency<HomeRepositoryIml>(() => HomeRepository());
    injector.registerDependency<UserListRespositoryIml>(
        () => UserListRepository(injector.get<ApiBaseHelper>()));
  }
}
