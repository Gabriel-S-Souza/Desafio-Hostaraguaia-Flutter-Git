import 'package:flutter/cupertino.dart';

import '../../domain/domain.dart';
import '../cubits/cubits.dart';

class GithubFeaturesController {
  final GithubReposCubit githubReposCubit;
  final PullRequestCubit pullRequestCubit;

  GithubFeaturesController({
    required this.githubReposCubit,
    required this.pullRequestCubit,
  });

  final LoadingOnScrollCubit loadingOnScrollCubit = LoadingOnScrollCubit();

  Future<void> loadReposPaginated() async {
    loadingOnScrollCubit.showLoading();
    await githubReposCubit.loadReposPaginated();
    loadingOnScrollCubit.removeLoading();
  }

  void goToPulls(BuildContext context, GithubRepoEntity repo) {
    pullRequestCubit.repo = repo;
    Navigator.pushNamed(context, '/pulls');
  }

  void backToRepos(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/repos'));
  }
}
