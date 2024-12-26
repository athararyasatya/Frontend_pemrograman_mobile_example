import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart'; // Import halaman Login

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> airAnalysis = [
    {
      "name": "Water Higienis",
      "products": [
        {"name": "Kekeruhan", "isChecked": false},
        {"name": "pH", "isChecked": false},
      ],
    },
    {
      "name": "Air Limbah Impal",
      "products": [
        {"name": "Kekeruhan", "isChecked": false},
        {"name": "pH", "isChecked": false},
      ],
    },
  ];

  final List<Map<String, dynamic>> environmentAnalysis = [
    {
      "name": "Udara Ambient 24 jam",
      "products": [
        {"name": "Kekeruhan", "isChecked": false},
        {"name": "pH", "isChecked": false},
      ],
    },
    {
      "name": "Emisi Pembangkit",
      "products": [
        {"name": "Kekeruhan", "isChecked": false},
        {"name": "pH", "isChecked": false},
      ],
    },
  ];

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF7F7F7), // Warna putih terang
      endDrawer: Drawer( // Tambahkan endDrawer untuk sidebar
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header pengguna
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.teal,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cuita Tri Arsheila",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "Cuitatriashh@gmail.com",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),

              // Menu list
              ListTile(
                leading: const Icon(Icons.home, color: Colors.teal),
                title: Text(
                  "Home",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Tutup sidebar
                },
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.teal),
                title: Text(
                  "Profile",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Tutup sidebar
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Profil belum dibuat'),
                  ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: Text(
                  "Logout",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.redAccent,
                  ),
                ),
                onTap: () {
                  _logout(context); // Logout dan arahkan ke halaman login
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 110, left: 16, right: 16, bottom: 80),
              child: Column(
                children: [
                  // Konten utama (Analisis Air dan Lingkungan)
                  buildAnalysisSection(
                    context,
                    title: "Analisis Air",
                    icon: Icons.water_drop,
                    data: airAnalysis,
                  ),
                  buildAnalysisSection(
                    context,
                    title: "Analisa Lingkungan",
                    icon: Icons.air,
                    data: environmentAnalysis,
                  ),
                ],
              ),
            ),
          ),

          // Logo perusahaan di kiri atas
          Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logo perusahaan'),
                  ),
                );
              },
              child: Container(
                height: screenHeight * 0.06,
                width: screenWidth * 0.12,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo_login.png'), // Path logo perusahaan
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          // Ikon person di kanan atas
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer(); // Buka sidebar
              },
              child: CircleAvatar(
                radius: screenWidth * 0.06, // Responsif
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: screenWidth * 0.05, // Responsif
                ),
              ),
            ),
          ),

          // Tombol Next di kanan bawah pojok
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Next Button Clicked")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "NEXT",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.chevron_right, // Ikon ">"
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAnalysisSection(BuildContext context,
      {required String title, required IconData icon, required List<Map<String, dynamic>> data}) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2), // Border hijau
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(8),
        color: Colors.transparent,
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent, // Hapus garis divider
          ),
          child: ExpansionTile(
            collapsedIconColor: Colors.teal,
            iconColor: Colors.teal,
            leading: Icon(
              icon,
              size: screenWidth * 0.06, // Responsif
              color: Colors.teal,
            ),
            title: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.045, // Responsif
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            children: data.map((category) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(8),
                child: ExpansionTile(
                  collapsedIconColor: Colors.teal,
                  iconColor: Colors.teal,
                  title: Text(
                    category["name"],
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.04, // Responsif
                      color: Colors.teal.shade700,
                    ),
                  ),
                  children: category["products"].map<Widget>((product) {
                    return CheckboxListTile(
                      title: Text(
                        product["name"],
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.035, // Responsif
                          color: Colors.teal.shade900,
                        ),
                      ),
                      value: product["isChecked"],
                      onChanged: (bool? value) {
                        setState(() {
                          product["isChecked"] = value!;
                        });
                      },
                      activeColor: Colors.teal,
                      checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
