import 'package:flutter/cupertino.dart';
import 'package:flutter_task3/data/dio_config.dart';
import 'package:flutter_task3/presentation/models/ProfileModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

String? userId = "d28c8b67-15e8-4f49-9a19-47d280f702a1";
final SupabaseClient supabase = Supabase.instance.client;


String? getUserId() {
  return userId;
}

void signup(String password, ProfileModel profile, VoidCallback callback) async {
    var result = await supabase.auth.signUp(
        email: profile.email,
        password: password
    );

    await getHttpClient().post(
          "/users",
          data: {
            "user_id": result.user?.id,
            "username": profile.name,
            "email": profile.email
          }
        );

    callback();
}


void signin(String email, String password) async {
  var result = await supabase.auth.signInWithPassword(
      email: email, password: password
  );

  if (result.user == null) {
    throw Exception("Что-то пошло не так");
  }
  userId = result.user?.id;
}
