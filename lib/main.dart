import 'package:flutter/material.dart';
import 'package:wilayah_indonesia_api/presentation/pages/wilayah_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Wilayah Indonesia API",
      theme: ThemeData(primarySwatch: Colors.green),
      home: const WilayahScreen(),
    );
  }
}
