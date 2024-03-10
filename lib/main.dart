import 'package:flutter/material.dart';
import 'package:sda_quo/pages/splash.dart';

void main() {
  runApp(const SDAQUO());
}

class SDAQUO extends StatelessWidget {
  const SDAQUO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SDAQUO',
      theme: ThemeData(
        // Use a custom color scheme for a more modern look
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF673AB7), // Deep purple accent
          primary: const Color(0xFF673AB7), // Use the seed color as primary
          secondary: const Color(0xFFC02942), // Lighter accent for contrast
          background: Colors.white, // White background for better readability
          surface: Colors.white, // White surface for buttons and cards
          onPrimary: Colors.white, // White text on primary for contrast
          onSecondary: Colors.white, // White text on secondary for contrast
          onBackground: Colors.black, // Black text on white background
          onError: Colors.redAccent, // Red for error messages
        ),
        // Enable Material 3 for a more modern look and feel
        useMaterial3: true,
        // Customize button styles for a sleek look
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            backgroundColor: const Color(0xFF673AB7), // Deep purple for buttons
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            side: const BorderSide(color: Color(0xFF673AB7)), // Deep purple border
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
        // Customize text field styles for a modern look
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xFF673AB7)), // Deep purple border
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xFFC02942)), // Lighter accent for focus
          ),
        ),
        // Customize text styles for improved readability
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 14, color: Colors.black), // Black for body text
          bodyMedium: TextStyle(fontSize: 12, color: Colors.grey), // Grey for secondary text
          displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Bold headings
          displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Slightly smaller bold headings
          displaySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Even smaller bold headings
          titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Bold subheadings
        ),
        // Customize app bar styles for a modern look
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 71, 58, 183), // Deep purple for app bar
          foregroundColor: Colors.white, // White text for contrast
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Bold title
          elevation: 4.0, // Add some elevation for a subtle shadow
        ),
      ),
      home: const SplashScreen(),
    );
  }
}