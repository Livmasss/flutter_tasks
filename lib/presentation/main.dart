import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/screens/auth/signup_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://ijymxlmgppyfwewmvzlp.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqeW14bG1ncHB5Zndld212emxwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI1NDcyNTEsImV4cCI6MjA0ODEyMzI1MX0.R7oYHuUTaxFmIevSisoldrYft3_h4wQrFGhF3DSlc2E'
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(
        child: getSignupOrMain(),
      )
    );
  }
}

Widget getSignupOrMain() {
  return const SignupScreen();
}
