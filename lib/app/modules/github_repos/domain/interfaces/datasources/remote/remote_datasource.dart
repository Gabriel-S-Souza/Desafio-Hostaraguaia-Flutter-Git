import '../../../domain.dart';

abstract class RemoteDataSource {
  Future<List<GithubRepoEntity>> getRepos(int pageNumber);
  Future<List<PullRequestEntity>> getPullRequests(String owner, String repo);
}
