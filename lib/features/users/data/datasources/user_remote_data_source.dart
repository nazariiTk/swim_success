import 'package:dio/dio.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/api_constants.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await dio.get(ApiConstants.users);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw ServerException('Failed to load users (Status Code: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Unknown network error');
    } catch (e) {
      throw ServerException('An unexpected error occurred: $e');
    }
  }
}
