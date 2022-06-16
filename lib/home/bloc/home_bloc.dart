import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:k11/home/data/home_repository_iml.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepositoryIml homeRepositoryIml;

  HomeBloc(this.homeRepositoryIml) : super(const HomeState()) {
    on<GetData>(_getData);
  }

  _getData(GetData event, Emitter<HomeState> emit) {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      Future.delayed(const Duration(milliseconds: 1000), () {
        emit(state.copyWith(status: HomeStatus.success));
      });
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
