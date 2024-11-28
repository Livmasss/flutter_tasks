import 'package:flutter/material.dart';
import 'package:flutter_task3/data/user_service.dart';
import 'package:flutter_task3/presentation/models/profile_model.dart';
import 'package:flutter_task3/presentation/screens/main_router.dart';
import 'package:flutter_task3/presentation/screens/auth/signin_screen.dart';

import '../../widgets/text_field_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var email = "";
  var password = "";
  var phoneNumber = "";
  var name = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const SigninScreen())
                  );
                },
                child: const Text("Уже есть аккаунт")
            ),

            OutlinedButton(
                onPressed: () {
                  debugPrint("OutlinedButton pressed");
                  try {
                    signup(
                        password,
                        ProfileModel(name, "", 0, phoneNumber, email),
                        signupCallback
                    );
                  }
                  catch(e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Что-то пошло не так!')),
                    );
                  }
                },
                child: const Text("Создать аккаунт")
            ),
          ],
        ),
      ),
    );
  }

  void signupCallback() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Вы зарегистрированы')),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainRouter()),
    );
  }
}