import 'package:dartz/dartz.dart';
import 'package:desafio_hostaraguaia_flutter/app/core/core.dart';
import 'package:desafio_hostaraguaia_flutter/app/modules/github_repos/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGithubReposRepository extends Mock implements GithubReposRepository {}

void main() {
  late GithubReposRepository repository;
  late GithubReposCase githubReposCase;
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

  setUp(() {
    repository = MockGithubReposRepository();
    githubReposCase = GithubReposCase(repository);
  });

  group('GithubReposCase |', () {
    test('Should return a List<GithubRepoEntity>', () async {
      // arrange
      when(() => repository.getReposFromApi(any()))
          .thenAnswer((_) async => Right([repoEntity]));

      // act
      final response = await githubReposCase.getReposFromApi(1);
      final result = response.fold((l) => l, (r) => r);

      // assert
      expect(result, isA<List<GithubRepoEntity>>());
    });

    test('Should return a ExceptionApp', () async {
      // arrange
      when(() => repository.getReposFromApi(any()))
          .thenAnswer((_) async => Left(ServerException()));

      // act
      final response = await githubReposCase.getReposFromApi(1);
      final result = response.fold((l) => l, (r) => r);

      // assert
      expect(result, isA<ServerException>());
    });
  });
}
