part of 'home_bloc.dart';

enum HomeStatus { initial, success, error, loading }

extension HomeStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isSuccess => this == HomeStatus.success;
  bool get isError => this == HomeStatus.error;
  bool get isLoading => this == HomeStatus.loading;
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
  });

  final HomeStatus status;

  HomeState copyWith({
    HomeStatus? status,
  }) =>
      HomeState(status: status ?? this.status);

  @override
  List<Object> get props => [status];
}
