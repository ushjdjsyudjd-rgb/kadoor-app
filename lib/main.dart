import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(KadoorApp());
}

class KadoorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'کادور پخش شمال',
      debugShowCheckedModeBanner: false,
      // تنظیمات تم رنگی بر اساس سایت کادور
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.red,
        primaryColor: const Color(0xFFC62828),
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFC62828),
          elevation: 2,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
