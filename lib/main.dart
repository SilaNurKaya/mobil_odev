import 'package:flutter/material.dart';
import 'screens/kitap_listesi_ekrani.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitap Arşivi',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Ana renk
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontSize: 18, color: Colors.black87), // eski bodyText1 yerine
          bodyMedium: TextStyle(
              fontSize: 16, color: Colors.black87), // eski bodyText2 yerine
          headlineSmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold), // eski headline6 yerine
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(
                255, 183, 156, 229), // Buton arka plan rengi (background)
            foregroundColor: const Color.fromARGB(
                255, 153, 226, 241), // Buton yazı rengi (foreground)
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      home: KitapListesiEkrani(),
    );
  }
}
