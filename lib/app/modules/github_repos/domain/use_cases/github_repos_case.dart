import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class GithubReposCase {
  final GithubReposRepository _repository;

  GithubReposCase(this._repository);

  Future<Either<ExceptionApp, List<GithubRepoEntity>>> getReposFromApi(
          int pageNumber) async =>
      _repository.getReposFromApi(pageNumber);
}
