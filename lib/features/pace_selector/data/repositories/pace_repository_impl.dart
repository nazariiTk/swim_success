import '../../domain/repositories/pace_repository.dart';
import '../datasources/pace_remote_data_source.dart';

class PaceRepositoryImpl implements PaceRepository {
  final PaceRemoteDataSource remoteDataSource;

  PaceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> submitPace(int paceSeconds) async {
    try {
      await remoteDataSource.submitPace(paceSeconds);
    } catch (e) {
      rethrow;
    }
  }
}
