import 'package:equatable/equatable.dart';

abstract class LoadingOnScrollState extends Equatable {
  const LoadingOnScrollState();
}

class LoadingOnScrollActive extends LoadingOnScrollState {
  const LoadingOnScrollActive();

  @override
  List<Object?> get props => [];
}

class LoadingOnScrollDisabled extends LoadingOnScrollState {
  const LoadingOnScrollDisabled();

  @override
  List<Object?> get props => [];
}
