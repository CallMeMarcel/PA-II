import 'dart:convert';
import 'package:del_cafeshop/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// Import halaman NavigationMenu (ganti path jika perlu)


class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rememberMe = false.obs;
  final formKey = GlobalKey<FormState>();

  /// Fungsi untuk melakukan login ke API
  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    final url = Uri.parse('http://192.168.32.183:8000/user/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
        }),
      );
      


      final data = jsonDecode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        if (rememberMe.value) {

          // Simpan token atau preferensi login di SharedPreferences (opsional)
          print('Remember me is enabled');
        }

        Get.snackbar('Sukses', 'Login berhasil');
        // Arahkan ke halaman utama (NavigationMenu)
        Get.offAll(() => NavigationMenu());
      } else {
        Get.snackbar('Login Gagal', data['message'] ?? 'Email atau password salah');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
