import '../domain.dart';

class GithubRepoEntity {
  final int id;
  final String login;
  final String name;
  final String description;
  final String pullsUrl;
  final int stargazersCount;
  final int forksCount;
  final ProfileEntity profile;

  GithubRepoEntity({
    required this.id,
    required this.login,
    required this.name,
    required this.description,
    required this.pullsUrl,
    required this.stargazersCount,
    required this.forksCount,
    required this.profile,
  });
}
