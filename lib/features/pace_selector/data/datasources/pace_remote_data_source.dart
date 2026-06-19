import 'package:dio/dio.dart';
import '../../../../core/network/api_constants.dart';

abstract class PaceRemoteDataSource {
  Future<void> submitPace(int paceSeconds);
}

class PaceRemoteDataSourceImpl implements PaceRemoteDataSource {
  final Dio dio;

  PaceRemoteDataSourceImpl({required this.dio});

  @override
  Future<void> submitPace(int paceSeconds) async {
    await dio.post(
      ApiConstants.posts,
      data: {
        'pace_seconds': paceSeconds,
      },
    );
  }
}
