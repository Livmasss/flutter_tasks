import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/screens/main_router.dart';
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
          error: const Color(0xFFFD3535),
          onSurface: const Color(0xFF000000),
          onSurfaceVariant: const Color(0xFF939396),
          background: const Color(0xFFFFFFFF)

        ),
        textTheme: TextTheme(
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 24,
            color: Theme.of(context).colorScheme.onSurface
          ),
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 17,
            color: Theme.of(context).colorScheme.onSurface
          ),
          bodyMedium: GoogleFonts.montserrat(
            fontSize: 16
          ),
          bodySmall: GoogleFonts.montserrat(
            fontSize: 15,
            color: const Color(0xFF939396)
          ),
        ),
      ),
      home: const MainRouter()
    );
  }
}
