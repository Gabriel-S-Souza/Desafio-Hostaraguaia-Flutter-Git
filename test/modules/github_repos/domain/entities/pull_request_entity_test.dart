import 'package:desafio_hostaraguaia_flutter/app/modules/github_repos/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final PullRequestEntity pullRequestEntity = PullRequestEntity(
    id: 1,
    login: 'login',
    state: 'state',
    title: 'title',
    urlAvatar: 'urlAvatar',
  );

  test('The PullRequestEntity must exist', () {
    expect(pullRequestEntity, isA<PullRequestEntity>());
  });
}
