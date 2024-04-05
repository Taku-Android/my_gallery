import 'Data.dart';

/// data : {"images":["https://flutter.prominaagency.com/media/309/3.jpg"]}

class GetImagesModel {
  GetImagesModel({
      Data? data,}){
    _data = data;
}

  GetImagesModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}