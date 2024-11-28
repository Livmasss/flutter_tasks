import 'package:flutter/material.dart';
import 'package:flutter_task3/data/user_service.dart';
import 'package:flutter_task3/presentation/screens/main_router.dart';
import 'package:flutter_task3/presentation/widgets/text_field_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final SupabaseClient supabase = Supabase.instance.client;
  var email = "";
  var password = "";

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
                hintText: "Emain",
              ),
              const SizedBox(height: 8.0),
              MyTextFieldWidget(
                initialValue: password,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                hintText: "Пароль",
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                  onPressed: () {
                    try {
                      signin(email, password);
                    }
                    catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Что-то пошло не так!')),
                      );
                    }
                    finally {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => const MainRouter()
                      ));
                    }
                  },
                  child: const Text(
                      "Войти"
                  )
              )
            ],
          ),
        ),
    );
  }
}
