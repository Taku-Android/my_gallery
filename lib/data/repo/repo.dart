import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:my_gallery/core/error/failure.dart';
import 'package:my_gallery/data/model/GetImagesModel.dart';
import 'package:my_gallery/data/model/LoginResponse.dart';
import 'package:my_gallery/data/model/login_data.dart';

abstract class Repo {


  Future<Either<Failure , LoginResponse>> login(LoginData data);
  Future<Either<Failure , LoginResponse>> uploadImage(File imageFile);
  Future<Either<Failure , GetImagesModel>> getImages();

}