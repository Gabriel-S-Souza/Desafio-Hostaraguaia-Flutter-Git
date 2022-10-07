import '../../../domain.dart';

abstract class LocalDataSource {
  Future<List<GithubRepoEntity>> getLocally();
  Future<void> putLocally();
}
