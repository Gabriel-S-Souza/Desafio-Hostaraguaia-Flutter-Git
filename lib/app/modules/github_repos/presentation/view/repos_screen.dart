import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../di/di.dart';
import '../../github_repos.dart';
import 'widgets/widgets.dart';

class ReposScreen extends StatelessWidget {
  ReposScreen({super.key});

  final _controller = Locator.get<GithubFeaturesController>();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LoadingOnScrollCubit, LoadingOnScrollState>(
        bloc: _controller.loadingOnScrollCubit,
        builder: (context, paginationState) => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                leading: const Icon(Icons.menu),
                title: const Text(
                  'Github JavaPop',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              body: BlocBuilder<GithubReposCubit, GithubReposState>(
                bloc: _controller.githubReposCubit,
                builder: (context, state) {
                  if (state is GithubReposCompleted) {
                    return LazyLoadScrollView(
                      onEndOfPage: _controller.loadReposPaginated,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(top: 24),
                        itemBuilder: (context, index) => ItemRepoWidget(
                          onTap: (repo) => _controller.goToPulls(context, repo),
                          repo: state.repos[index],
                        ),
                        separatorBuilder: (context, index) => const Divider(
                          thickness: 1,
                          height: 1,
                          indent: 16,
                        ),
                        itemCount:
                            _controller.githubReposCubit.reposList.length,
                      ),
                    );
                  } else if (state is GithubReposLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const Center(
                    child: Text('Não foi possível carregar os dados'),
                  );
                },
              ),
            ),
            paginationState is LoadingOnScrollActive
                ? const LoadingWidget()
                : const SizedBox()
          ],
        ),
      );
}
