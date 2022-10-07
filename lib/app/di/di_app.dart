import 'package:get_it/get_it.dart';

import '../modules/github_repos/data/data.dart';
import '../modules/github_repos/domain/domain.dart';
import '../modules/github_repos/presentation/presentation.dart';

class Locator {
  static void setUpDependencies() {
    final getIt = GetIt.instance;

    final githubReposRepository = GithubReposRepositoryImp(
      remoteDataSource: RemoteDataSourceImp(httpClient: HttpClientImp()),
      localDataSource: LocalDataSourceImp(),
    );

    final githubReposCase = GithubReposCase(githubReposRepository);
    final githubReposCubit = GithubReposCubit(githubReposCase);

    final pullRequestCase = PullRequestCase(githubReposRepository);
    final pullRequestCubit = PullRequestCubit(pullRequestCase);

    final githubReposController = GithubFeaturesController(
      githubReposCubit: githubReposCubit,
      pullRequestCubit: pullRequestCubit,
    );

    getIt.registerFactory(() => githubReposRepository);
    getIt.registerFactory(() => githubReposCase);
    getIt.registerFactory(() => githubReposCubit);
    getIt.registerFactory(() => pullRequestCase);
    getIt.registerFactory(() => pullRequestCubit);
    getIt.registerSingleton<GithubFeaturesController>(githubReposController);
  }

  static type get<type extends Object>() {
    final getIt = GetIt.instance;
    return getIt.get<type>();
  }
}
