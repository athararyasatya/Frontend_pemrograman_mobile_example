import 'package:flutter/material.dart';
import '../routes/route.dart';
import 'package:get/get.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
            Get.toNamed(Routes.profile);
          },
        ),
        title: Text('Client', style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                _buildClientCard(
                  name: "PT. Ada AQUA",
                  email: "ptadaaqua@gmail.com",
                  address: "Jl. pantang mundur",
                  phone: "081487226637",
                ),
                SizedBox(height: 16),
                _buildClientCard(
                  name: "PT. Ada AQUA",
                  email: "ptadaaqua@gmail.com",
                  address: "Jl. pantang mundur",
                  phone: "081487226637",
                ),
                SizedBox(height: 16),
                _buildClientCard(
                  name: "PT. Ada AQUA",
                  email: "ptadaaqua@gmail.com",
                  address: "Jl. pantang mundur",
                  phone: "081487226637",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle create action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('CREATE', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClientCard({
    required String name,
    required String email,
    required String address,
    required String phone,
  }) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.group, size: 32, color: Colors.green),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text("Email: $email"),
                Text("Address: $address"),
                Text("Phone: $phone"),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black54),
            onPressed: () {
              // Handle edit action
            },
          ),
        ],
      ),
    );
  }
}
