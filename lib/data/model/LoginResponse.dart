import 'User.dart';

/// user : {"id":212,"name":"Palma Walker IV","email":"liza36@example.org","email_verified_at":"2024-03-31T22:07:03.000000Z","created_at":"2024-03-31T22:07:03.000000Z","updated_at":"2024-03-31T22:07:03.000000Z"}
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTExMGNhYTExMWVkMTk3YjJhNWNmYzUzNGFkNWYzODEzMDZmNGU3MGUwNTkwNGEwNzE3MWU1NDU1ODUwYTYzODkxN2JjNThhMzQzMmM2NTIiLCJpYXQiOjE3MTIyODY3NzIuMDgwNTY0LCJuYmYiOjE3MTIyODY3NzIuMDgwNTY1LCJleHAiOjE3NDM4MjI3NzIuMDc5MzE3LCJzdWIiOiIyMTIiLCJzY29wZXMiOltdfQ.BJgA6JQ58PBj6yrlAWOKRbrgNCjUY6w7aDg4-GckpnXg9MtPoGPUtJ5oSXG3CVliiIDh9eDaJmvYB4Itp2wIq_1QrCMRI6z_gs7BLWoh-z1zrNk6NWVInkZu-AJUUdhs3LalKM_aCCeUkjckugQ5PK91fiAHOONiT6ZBsRALqkajhdJ2lFgYakVRhwSjgwrgdfBFKiEj14Vy_ndW4x1zBWDkSLSczgcIndSLGJixjG1ZMD6niBw0rfowti9yNvkFeAG8wgS1IiywukL3d692EwZfGRx5T9suGb3LQSra6ZJjCqs_8SItitxorMqLnXGkQVqudux5papxY-JqJJr6pRBsxCVPUSmTk3zjhBwBX-mZKle11MsKjrqBRkAsi5JZ3QypZ67iOhidswikBGuXtpmMIxhfuNJUQzFjjYlso9YEWOJAlucKwmDbrdllOyTqKLAZxFP8u9CBJ0U2Ko95Fpnd7OK5VnGRdkEnw-B27LJ6vRX8tAtMbUKnKhg4wx_5dNW3ttSnQ02rCbb2lOpbLXVILI9uA13mwYRtnUiYQYY_Xp3XwJsi7hnzre_581BAdIfshETXejJv64oAzCKkCggQkm4Rj1SwA_wy0XdKgDyEFFOr43roCUy3MSLkejSxdoAoDtRQNV34dHNJhr7tsiTO5N4aWy6kWQDSVUMN64g"

class LoginResponse {
  LoginResponse({User? user, String? token, String? message}) {
    _user = user;
    _token = token;
    _message = message;
  }

  LoginResponse.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
    _message = json['message'];
  }

  User? _user;
  String? _token;
  String? _message;

  User? get user => _user;

  String? get token => _token;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    map['message'] = _message;
    return map;
  }
}
