import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/data/repo/repo.dart';
import 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit(this.repo) : super(ImagesInitial());

  final Repo repo;

  getImages() async {
    emit(ImagesLoading());
    var result = await repo.getImages();

    result.fold(
        (failure) => emit(ImagesFailure(failure.errMessage)),
        (success) => emit(
          ImagesSuccess(success),
            ));
  }
}
