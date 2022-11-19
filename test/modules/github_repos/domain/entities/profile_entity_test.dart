import 'package:desafio_hostaraguaia_flutter/app/modules/github_repos/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final ProfileEntity profileEntity = ProfileEntity(
    id: 1,
    login: 'login',
    avatarUrl: 'avatarUrl',
  );

  test('The ProfileEntity must exist', () {
    expect(profileEntity, isA<ProfileEntity>());
  });
}
