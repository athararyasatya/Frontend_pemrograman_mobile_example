import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:google_fonts/google_fonts.dart';
import 'home.dart'; // Import halaman Home

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // Untuk melacak visibilitas password

  void _login() {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackbar(
        title: "Error",
        message: "Field harus diisi semua!",
        isSuccess: false,
      );
    } else {
      _showSnackbar(
        title: "Berhasil",
        message: "Login berhasil!",
        isSuccess: true,
      );

      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    }
  }

  void _showSnackbar({required String title, required String message, required bool isSuccess}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isSuccess ? Colors.green : Colors.redAccent,
      colorText: Colors.white,
      borderRadius: 12,
      margin: const EdgeInsets.all(12),
      duration: const Duration(seconds: 2),
      icon: Icon(
        isSuccess ? Icons.check_circle : Icons.error,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Bagian atas putih dengan logo di pojok kiri atas
          Positioned(
            top: 20, // Naikkan sedikit
            left: 20, // Posisikan di pojok kiri
            child: Container(
              height: screenHeight * 0.08,
              width: screenWidth * 0.2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo_login.png'), // Path logo
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Icon di pojok kanan atas, terlihat "terpotong"
          Positioned(
            top: -screenHeight * 0.05, // Sebagian keluar dari layar atas
            right: -screenWidth * 0.1, // Sebagian keluar dari layar kanan
            child: Container(
              height: screenHeight * 0.3,
              width: screenHeight * 0.3,
              decoration: const BoxDecoration(
                color: Color(0xFF00A651), // Warna hijau
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.water_drop, // Icon seperti di gambar
                  color: Colors.white,
                  size: screenWidth * 0.2, // Perbesar ukuran icon
                ),
              ),
            ),
          ),
          // Bagian login
          Positioned(
            top: screenHeight * 0.4, // Naikkan container login
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.6, // Sesuaikan tinggi container login
              decoration: BoxDecoration(
                color: const Color.fromARGB(245, 229, 229, 229),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 400,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            fontSize: screenHeight * 0.035,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00A651), // Warna hijau
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        // Input field Username
                        TextField(
                          controller: _usernameController,
                          style: GoogleFonts.poppins(
                            fontSize: screenHeight * 0.02,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: screenHeight * 0.018,
                            ),
                            prefixIcon: const Icon(
                              Icons.person, // Icon username
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            contentPadding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.018,
                              horizontal: screenWidth * 0.04,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        // Input field Password dengan icon mata
                        TextField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          style: GoogleFonts.poppins(
                            fontSize: screenHeight * 0.02,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: screenHeight * 0.018,
                            ),
                            prefixIcon: const Icon(
                              Icons.lock, // Icon password
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            contentPadding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.018,
                              horizontal: screenWidth * 0.04,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        // Tombol Log In
                        Center(
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00A651),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02,
                                horizontal: screenWidth * 0.2,
                              ),
                            ),
                            child: Text(
                              'Log In',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.02,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
