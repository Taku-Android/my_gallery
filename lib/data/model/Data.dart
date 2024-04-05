/// images : ["https://flutter.prominaagency.com/media/309/3.jpg"]

class Data {
  Data({
      List<String>? images,}){
    _images = images;
}

  Data.fromJson(dynamic json) {
    _images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  List<String>? _images;

  List<String>? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['images'] = _images;
    return map;
  }

}