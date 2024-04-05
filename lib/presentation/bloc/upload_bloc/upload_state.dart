
import '../../../data/model/LoginResponse.dart';

abstract class UploadState {}

class UploadInitial extends UploadState {}

class UploadLoading extends UploadState {}

class UploadSuccess extends UploadState {
  final LoginResponse loginResponse ;

  UploadSuccess(this.loginResponse);

}

class UploadFailure extends UploadState {
  final String errMsg ;

  UploadFailure(this.errMsg);
}