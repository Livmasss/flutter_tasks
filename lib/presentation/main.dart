import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/screens/MainRouter.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff1a6fee)
        ),
        useMaterial3: true,
      ),
      home: const MainRouter()
    );
  }
}
