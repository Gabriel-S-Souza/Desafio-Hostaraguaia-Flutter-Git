import '../../../domain/domain.dart';
import '../contracts/contracts.dart';

class LocalDataSourceImp implements LocalDataSource {
  @override
  Future<List<GithubRepoEntity>> getLocally() {
    // TODO: implement getLocally
    throw UnimplementedError();
  }

  @override
  Future<void> putLocally() {
    // TODO: implement postLocally
    throw UnimplementedError();
  }
}
