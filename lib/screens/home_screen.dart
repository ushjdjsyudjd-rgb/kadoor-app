import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  String selectedCategory = "همه"; // دسته انتخاب شده

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("کادور پخش شمال", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFC62828),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Product>>(
        future: apiService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Color(0xFFC62828)));
          }
          
          List<Product> allProducts = snapshot.data ?? [];
          // استخراج لیست دسته‌بندی‌های یکتا از اکسل
          List<String> categories = ["همه", ...allProducts.map((p) => p.category).toSet().toList()];
          
          // فیلتر کردن محصولات بر اساس انتخاب کاربر
          List<Product> displayedProducts = selectedCategory == "همه" 
              ? allProducts 
              : allProducts.where((p) => p.category == selectedCategory).toList();

          return Column(
            children: [
              // منوی افقی دسته‌بندی‌ها
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedCategory == categories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                      child: ActionChip(
                        label: Text(categories[index]),
                        backgroundColor: isSelected ? Color(0xFFC62828) : Colors.white,
                        labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                        onPressed: () {
                          setState(() { selectedCategory = categories[index]; });
                        },
                      ),
                    );
                  },
                ),
              ),
              // نمایش محصولات (همان کد قبلی با لیست فیلتر شده)
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.65, crossAxisSpacing: 10, mainAxisSpacing: 10,
                  ),
                  itemCount: displayedProducts.length,
                  itemBuilder: (context, index) {
                    final product = displayedProducts[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Column(
                        children: [
                          Expanded(child: Image.network(product.image, fit: BoxFit.contain)),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(product.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13), textAlign: TextAlign.center),
                          ),
                          Text(product.price, style: TextStyle(color: Color(0xFFC62828), fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC62828)),
                            onPressed: () {},
                            child: Text("افزودن", style: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
