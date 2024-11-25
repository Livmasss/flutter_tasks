import 'dart:convert';

import '../presentation/models/ProfileModel.dart';
import 'UserService.dart';
import 'dio_config.dart';

var profileModel = ProfileModel("Сейранян С.Г.", "Эфбо-01-22", 8, "+70000000000", "MyCoolEmail@pochta.com");
Future<ProfileModel> getProfile() async {
  var userId = getUserId();
  var result = await getHttpClient().get("/profile/$userId");

  return deserializeProfile(jsonDecode(result.data));
}

ProfileModel deserializeProfile(dynamic json) {
  return ProfileModel(
      json['username'],
      "ЭФБО-01-22",
      0,
      "+71234567890",
      json['email']
  );
}
