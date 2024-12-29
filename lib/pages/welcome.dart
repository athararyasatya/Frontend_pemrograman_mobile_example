import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double _opacity = 0.0; // Opacity awal (transparan)

  @override
  void initState() {
    super.initState();

    // Animasi fade in
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0; // Ubah opacity ke 1 (muncul)
      });
    });

    // Jadwalkan navigasi ke halaman login dengan fade out
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _opacity = 0.0; // Ubah opacity ke 0 (menghilang)
      });

      // Navigasi setelah animasi fade out selesai
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.offAllNamed(Routes.login); // Pindah ke halaman login
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.green, 
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 1000), 
          opacity: _opacity, 
          curve: Curves.easeInOut, 
          child: Container(
            height: screenHeight * 0.3,
            width: screenWidth * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Logo1.png'), 
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
