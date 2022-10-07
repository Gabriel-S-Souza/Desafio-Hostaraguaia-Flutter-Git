import '../../domain/entities/entities.dart';
import '../data.dart';

class GithubRepoModel {
  final int id;
  final String login;
  final String name;
  final String description;
  final String pullsUrl;
  final int stargazersCount;
  final int forksCount;
  final ProfileModel profile;

  GithubRepoModel({
    required this.id,
    required this.login,
    required this.name,
    required this.profile,
    required this.description,
    required this.pullsUrl,
    required this.stargazersCount,
    required this.forksCount,
  });

  factory GithubRepoModel.fromJson(Map<String, dynamic> json) =>
      GithubRepoModel(
        id: json['id'],
        name: json['name'],
        login: json['owner']['login'],
        profile: ProfileModel.fromJson(json['owner']),
        description: json['description'],
        pullsUrl: json['pulls_url'],
        stargazersCount: json['stargazers_count'],
        forksCount: json['forks_count'],
      );

  GithubRepoEntity toEntity() => GithubRepoEntity(
      id: id,
      name: name,
      login: login,
      description: description,
      pullsUrl: pullsUrl,
      stargazersCount: stargazersCount,
      forksCount: forksCount,
      profile: profile.toEntity());
}
