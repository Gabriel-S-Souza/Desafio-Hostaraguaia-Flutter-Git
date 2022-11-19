import 'package:desafio_hostaraguaia_flutter/app/modules/github_repos/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final GithubRepoEntity repoEntity = GithubRepoEntity(
    id: 1,
    login: 'login',
    name: 'name',
    description: 'description',
    pullsUrl: 'pullsUrl',
    stargazersCount: 1,
    forksCount: 1,
    profile: ProfileEntity(
      id: 1,
      login: 'login',
      avatarUrl: 'avatarUrl',
    ),
  );

  test('The GithubRepoEntity must exist', () {
    expect(repoEntity, isA<GithubRepoEntity>());
  });
}
