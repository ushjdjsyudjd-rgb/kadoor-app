import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  // لینک API اختصاصی گوگل شیت شما
  static const String apiUrl = "https://sheetdb.io/api/v1/czatwlt4x2234";

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // چون SheetDB یک لیست مستقیماً برمی‌گرداند
        List<dynamic> body = jsonDecode(response.body);
        return body.map((item) => Product.fromJson(item)).toList();
      } else {
        print("خطا در سرور: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("خطا در شبکه یا کد: $e");
      return [];
    }
  }
}
