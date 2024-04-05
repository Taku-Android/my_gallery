import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_gallery/core/error/failure.dart';
import 'package:my_gallery/data/model/GetImagesModel.dart';
import 'package:my_gallery/data/model/LoginResponse.dart';
import 'package:my_gallery/data/model/login_data.dart';
import 'package:my_gallery/data/repo/repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  @override
  Future<Either<Failure, LoginResponse>> uploadImage(File imageFile) async {
    try {
      dio.options.headers["content-type"] = "application/json";
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      dio.options.headers["Authorization"] = "Bearer $token";
      var formData = FormData.fromMap({
        'img': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
      });
      var response = await dio.post(UPLOAD_IMAGE_API, data: formData);
      return Right(LoginResponse.fromJson(response.data));
    }catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetImagesModel>> getImages() async {
    try {
      dio.options.headers["content-type"] = "application/json";
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio.get(GET_IMAGES_API);
      return Right(GetImagesModel.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

}