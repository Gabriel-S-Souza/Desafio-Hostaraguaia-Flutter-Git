import '../../domain/domain.dart';

class ProfileModel {
  final int id;
  final String login;
  final String avatarUrl;
  final String? name;

  ProfileModel({
    required this.id,
    required this.login,
    required this.avatarUrl,
    this.name,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json['id'],
        login: json['login'],
        avatarUrl: json['avatar_url'],
        name: json['name'],
      );

  ProfileEntity toEntity() => ProfileEntity(
        id: id,
        login: login,
        name: name,
        avatarUrl: avatarUrl,
      );
}
