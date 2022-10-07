class ProfileEntity {
  final int id;
  final String login;
  final String avatarUrl;
  final String? name;

  ProfileEntity({
    required this.id,
    required this.login,
    required this.avatarUrl,
    this.name,
  });
}
