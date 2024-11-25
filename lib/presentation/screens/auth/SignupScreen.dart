import 'package:flutter/material.dart';
import 'package:flutter_task3/data/UserService.dart';
import 'package:flutter_task3/presentation/models/ProfileModel.dart';
import 'package:flutter_task3/presentation/screens/MainRouter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../widgets/MyTextFieldWidget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SupabaseClient supabase = Supabase.instance.client;
  var email = "";
  var password = "";
  var phoneNumber = "";
  var name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyTextFieldWidget(
            initialValue: email,
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
            hintText: "Email",
          ),
          const SizedBox(height: 8.0),
          MyTextFieldWidget(
            initialValue: password,
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            hintText: "Password",
          ),
          const SizedBox(height: 8.0),
          MyTextFieldWidget(
            initialValue: name,
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
            hintText: "Username",
          ),
          const SizedBox(height: 8.0),
          MyTextFieldWidget(
            initialValue: phoneNumber,
            onChanged: (value) {
              setState(() {
                phoneNumber = value;
              });
            },
            hintText: "Phone number",
          ),

          const SizedBox(height: 24.0),

          OutlinedButton(
              onPressed: () {
                debugPrint("OutlinedButton pressed");
                signup();
              },
              child: const Text("Создать аккаунт")
          ),
        ],
      ),
    );
  }

  void signupCallback(AuthResponse response, ProfileModel profile) {
    var user = response.user;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Регистрация успешна!')),
    );
    setUserId(
        user?.id,
        profile
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainRouter()),
    );
  }

  void signup() {
    debugPrint("Signup");
    supabase.auth.signUp(
        email: email,
        password: password
    ).then((response) => {
      signupCallback(
          response,
          ProfileModel(name, "", 0, phoneNumber, email)
      )
    });
  }
}