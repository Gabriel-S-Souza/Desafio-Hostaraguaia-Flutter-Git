import 'package:dartz/dartz.dart';

import '../../../../../core/core.dart';
import '../../domain.dart';

abstract class GithubReposRepository {
  Future<Either<ExceptionApp, List<GithubRepoEntity>>> getReposFromApi(
      int pageNumber);
  Future<Either<ExceptionApp, List<PullRequestEntity>>> getPullRequests(
    String owner,
    String repo,
  );
  Future<List<GithubRepoEntity>> getReposFromDevice();
  Future<void> saveRepoLocally();
}
