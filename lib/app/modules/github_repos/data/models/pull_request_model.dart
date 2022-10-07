import '../../domain/domain.dart';

class PullRequestModel {
  final int id;
  final String title;
  final String urlAvatar;
  final String login;
  final String state;
  final String? fullName;
  final String? body;

  PullRequestModel({
    required this.id,
    required this.title,
    this.body,
    required this.urlAvatar,
    required this.login,
    required this.state,
    this.fullName,
  });

  factory PullRequestModel.fromJson(Map<String, dynamic> json) =>
      PullRequestModel(
        id: json['id'],
        title: json['title'],
        urlAvatar: json['user']['avatar_url'],
        login: json['user']['login'],
        fullName: json['user']['login'],
        state: json['state'],
        body: json['body'],
      );

  PullRequestEntity toEntity() => PullRequestEntity(
        id: id,
        title: title,
        body: body,
        login: login,
        state: state,
        urlAvatar: urlAvatar,
        fullName: fullName,
      );
}
