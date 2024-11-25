import 'package:flutter_task3/data/dio_config.dart';
import 'package:flutter_task3/presentation/models/ProfileModel.dart';

String? userId;

String? getUserId() {
  return userId;
}

void setUserId(String? id, ProfileModel profile) async {
  userId = id;
  var response = await getHttpClient().post(
      "/users",
    data: {
        "user_id": id,
        "username": profile.name,
        "email": profile.email
    }
  );
}