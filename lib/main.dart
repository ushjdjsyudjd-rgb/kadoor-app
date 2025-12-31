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
      theme: ThemeData(
        primarySwatch: Colors.green, // تم رنگی مناسب مواد غذایی
        fontFamily: 'Tahoma', // فعلاً از فونت سیستمی استفاده می‌کنیم
      ),
      home: HomeScreen(),
    );
  }
}
