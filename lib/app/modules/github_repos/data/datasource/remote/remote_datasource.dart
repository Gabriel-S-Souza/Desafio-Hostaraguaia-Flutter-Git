import '../../../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../data.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  final HttpClient httpClient;
  RemoteDataSourceImp({
    required this.httpClient,
  });

  @override
  Future<List<GithubRepoEntity>> getRepos(int pageNumber) async {
    try {
      final ResponseModel response = await httpClient.get(
        Constants.searchRepoPath,
        queryParameters: {
          'q': 'language:java',
          'sort': 'stars',
          'per_page': 20,
          'page': pageNumber,
        },
      );
      return (response.body!['items'] as List)
          .map((json) => GithubRepoModel.fromJson(json).toEntity())
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PullRequestEntity>> getPullRequests(
      String owner, String repo) async {
    try {
      final endpoint = '${Constants.repoPath}/$owner/$repo/pulls';
      final ResponseModel response = await httpClient.get(
        endpoint,
        queryParameters: {'state': 'all'},
      );
      return List<Map<String, dynamic>>.from(response.body)
          .map((json) => PullRequestModel.fromJson(json).toEntity())
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
