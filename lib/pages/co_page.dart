import 'package:flutter/material.dart';
import '../routes/route.dart';
import 'package:get/get.dart';

class CancelOrderPage extends StatelessWidget {
  const CancelOrderPage({super.key});

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
        title: Text('Cancel Order', style: TextStyle(color: Colors.green)),
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
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildOrderCard(
            icon: Icons.water_drop,
            title: "Analisis Air",
            orderNumber: "SO-000001",
            client: "PT. Ada AQUA",
            product: "Water higienis",
            totalAmount: "Rp. 104.062,00",
          ),
          SizedBox(height: 16),
          _buildOrderCard(
            icon: Icons.air,
            title: "Analisa Lingkungan",
            orderNumber: "SO-000002",
            client: "PT. Ada AQUA",
            product: "Udara Ambient 24 Jam",
            totalAmount: "Rp. 104.062,00",
          ),
          SizedBox(height: 16),
          _buildOrderCard(
            icon: Icons.air,
            title: "Analisa Lingkungan",
            orderNumber: "SO-000002",
            client: "PT. Ada AQUA",
            product: "Udara Ambient 24 Jam",
            totalAmount: "Rp. 104.062,00",
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard({
    required IconData icon,
    required String title,
    required String orderNumber,
    required String client,
    required String product,
    required String totalAmount,
  }) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: Colors.red),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text("Order Number: $orderNumber"),
                Text("Client: $client"),
                Text("Product: $product"),
                Text("Total Amount: $totalAmount"),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle Cancel Order button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Cancel Order'),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.black54),
            onPressed: () {
              // Handle forward action
              Get.toNamed(Routes.detailCancelOrder);
            },
          ),
        ],
      ),
    );
  }
}
