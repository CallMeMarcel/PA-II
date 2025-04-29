import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class WishlistService {
  static Future<List<Product>> getWishlist() async {
    final response = await http.get(Uri.parse('http://192.168.32.183:8000/admin/wishlist'));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load wishlist');
    }
  }
}
