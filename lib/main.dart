import 'package:flutter/material.dart';
import 'screens/kitap_listesi_ekrani.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitap Arşivi',
      home: KitapListesiEkrani(),
      debugShowCheckedModeBanner: false,
    );
  }
}
