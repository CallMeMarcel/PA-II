import 'category.dart'; // Import model Category yang sudah ada

class Product {
  final int id;
  final String name;
  final String description;
  final String status;
  final String title;
  final double price;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int categoryId;
  final Category category; // Menggunakan model Category yang sudah ada

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.title,
    required this.price,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryId,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'] ?? '', // Handle null dengan default value
      description: json['description'] ?? '',
      status: json['status'] ?? 'available',
      title: json['title'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0, // Handle berbagai tipe number
      image: json['image'] ?? '',
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : DateTime.now(), // Default value jika null
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : DateTime.now(),
      categoryId: json['category_id'] ?? 0,
      category: Category.fromJson(json['category'] ?? {}), // Handle null category
    );
  }

  // Tambahkan method toJson jika diperlukan
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'status': status,
      'title': title,
      'price': price,
      'image': image,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'category_id': categoryId,
      'category': category.toJson(), // Asumsikan ada method toJson di model Category
    };
  }
}