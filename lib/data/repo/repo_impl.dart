import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_gallery/core/error/failure.dart';
import 'package:my_gallery/data/model/LoginResponse.dart';
import 'package:my_gallery/data/model/login_data.dart';
import 'package:my_gallery/data/repo/repo.dart';

import '../../core/api/apiEndpoints.dart';

class RepoImpl extends Repo{

  final Dio dio;

  RepoImpl(this.dio);


  @override
  Future<Either<Failure, LoginResponse>> login(LoginData data) async {
    try {
      dio.options.headers["content-type"] = "application/json";
      final response = await dio.post(LOGIN_API, data: data.toMap());

      return right(LoginResponse.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

}