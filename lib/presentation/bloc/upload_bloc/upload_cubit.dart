import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/data/repo/repo.dart';
import 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit(this.repo) : super(UploadInitial());

  final Repo repo;

  upload(File file) async {
    emit(UploadLoading());
    var result = await repo.uploadImage(file);

    result.fold(
        (failure) => emit(UploadFailure(failure.errMessage)),
        (success) => emit(
              UploadSuccess(success),
            ));
  }
}
