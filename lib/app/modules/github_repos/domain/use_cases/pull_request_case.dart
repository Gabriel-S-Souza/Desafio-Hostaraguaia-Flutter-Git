import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class PullRequestCase {
  final GithubReposRepository _repository;

  PullRequestCase(this._repository);

  Future<Either<ExceptionApp, List<PullRequestEntity>>> getPullRequests(
    String owner,
    String repo,
  ) async =>
      _repository.getPullRequests(owner, repo);
}
