import 'package:flutter/material.dart';
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
            hintText: "Username",
          ),
          const SizedBox(height: 8.0),
          MyTextFieldWidget(
            initialValue: password,
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            hintText: "Username",
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

  void signupCallback(AuthResponse response) {
    var user = response.user;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Регистрация успешна!')),
    );



    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainRouter()),
    );
  }

  void signup() {
    debugPrint("Signup");
    supabase.auth.signUp(
        email: "Email@mail.com",
        password: "CoolMireaLivmas4"
    ).then((response) => {
      signupCallback(response)
    });
    // catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Что-то пошло не так: $e')),
    //   );
    // }
  }
}