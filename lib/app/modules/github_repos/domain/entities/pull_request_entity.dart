class PullRequestEntity {
  final int id;
  final String title;
  final String urlAvatar;
  final String login;
  final String state;
  final String? fullName;
  final String? body;

  PullRequestEntity({
    required this.id,
    required this.title,
    this.body,
    required this.urlAvatar,
    required this.login,
    required this.state,
    this.fullName,
  });
}
