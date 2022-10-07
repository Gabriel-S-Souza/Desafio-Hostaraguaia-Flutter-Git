import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

abstract class GithubReposState extends Equatable {
  const GithubReposState();
}

class GithubReposLoading extends GithubReposState {
  const GithubReposLoading();

  @override
  List<Object?> get props => [];
}

class GithubReposCompleted extends GithubReposState {
  final List<GithubRepoEntity> repos;

  const GithubReposCompleted({required this.repos});

  @override
  List<Object?> get props => [repos];
}

class GithubReposError extends GithubReposState {
  final String errorMessage;

  const GithubReposError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
