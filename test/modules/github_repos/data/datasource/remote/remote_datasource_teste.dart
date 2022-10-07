import 'package:desafio_hostaraguaia_flutter/app/di/di.dart';
import 'package:desafio_hostaraguaia_flutter/app/modules/github_repos/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class HttpMock extends Mock implements RemoteDataSource {}

final repoEntity = GithubRepoEntity(
  id: 1,
  login: 'login',
  name: 'name',
  description: 'description',
  pullsUrl: 'pullsUrl',
  stargazersCount: 1,
  forksCount: 1,
  profile: ProfileEntity(id: 1, login: 'login', avatarUrl: 'avatarUrl'),
);

void main() {
  Locator.setUpDependencies();
  final remoteDataSource = Locator.get<RemoteDataSource>();
  final List<GithubRepoEntity> reposMockList = [];
  for (var i = 0; i < 10; i++) {
    reposMockList.add(repoEntity);
  }

  group('Datasource |', () {
    test('getRepos | should return a List<GithubRepoEntity>', () async {
      when(() => remoteDataSource.getRepos(1)).thenAnswer(
        (invocation) async => reposMockList,
      );

      final response = await remoteDataSource.getRepos(1);

      expect(
        response,
        allOf(
          [
            isA<List<GithubRepoEntity>>(),
            isNotEmpty,
          ],
        ),
      );
    });
  });
}
