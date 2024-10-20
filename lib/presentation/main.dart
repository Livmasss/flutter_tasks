import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/screens/MainRouter.dart';
import 'package:google_fonts/google_fonts.dart';

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
          seedColor: const Color(0xFF1A6FEE),
          tertiary: const Color(0xFFFD3535),
          onSurface: const Color(0xFF000000),
          onSurfaceVariant: const Color(0xFF939396),
          background: const Color(0xFFFFFFFF)

        ),
        textTheme: TextTheme(
          // labelMedium: GoogleFonts.montserrat(
          //   fontSize: 12,
          //   fontWeight: FontWeight.bold,
          // ),
          // labelLarge: GoogleFonts.montserrat(
          //   fontSize: 12,
          //   fontWeight: FontWeight.bold,
          // ),
          // labelSmall: GoogleFonts.montserrat(
          //   fontSize: 12,
          //   fontWeight: FontWeight.bold,
          // ),
          bodyMedium: GoogleFonts.montserrat(
            fontSize: 12,
          ),
        ),
      ),
      home: const MainRouter()
    );
  }
}
