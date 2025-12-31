class Product {
  final String title;
  final String price;
  final String image;
  final String description;
  final String category; // فیلد جدید

  Product({
    required this.title, 
    required this.price, 
    required this.image, 
    required this.description,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] ?? 'بدون نام',
      price: json['price']?.toString() ?? '0',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? 'عمومی', // مقدار پیش‌فرض
    );
  }
}
