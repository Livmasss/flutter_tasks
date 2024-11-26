import 'package:flutter/cupertino.dart';
import 'package:flutter_task3/data/dio_config.dart';
import 'package:flutter_task3/presentation/models/ProfileModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

String? userId = "953ee85b-f837-4fd1-8183-c1614434b554";
final SupabaseClient supabase = Supabase.instance.client;


String? getUserId() {
  return userId;
}

void signup(String password, ProfileModel profile, VoidCallback callback) async {
    var result = await supabase.auth.signUp(
        email: profile.email,
        password: password
    );

    userId = result.user?.id;

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
