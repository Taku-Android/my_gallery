import 'package:my_gallery/data/model/GetImagesModel.dart';

abstract class ImagesState {}

class ImagesInitial extends ImagesState {}

class ImagesLoading extends ImagesState {}

class ImagesSuccess extends ImagesState {
  final GetImagesModel getImagesModel ;

  ImagesSuccess(this.getImagesModel);

}

class ImagesFailure extends ImagesState {
  final String errMsg ;

  ImagesFailure(this.errMsg);
}