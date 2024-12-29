import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route.dart';

class CancelOrderDetailPage extends StatelessWidget {
  const CancelOrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Cancel Order', style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/logo.png',
                          height: 50), // Replace with your logo asset
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PT. Chemviro Buana Indonesia',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            'Head Office',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildDetailRow('Order Number', 'SO-000001'),
                  _buildDetailRow('Client', 'PT. Ada AQUA'),
                  _buildDetailRow('Address', 'Jl. terus pantang mundur'),
                  _buildDetailRow('Email', 'ptadaaqua@gmail.com'),
                  _buildDetailRow('Phone', '081487226637'),
                  _buildDetailRow('Product', 'Analisis Air'),
                  _buildDetailRow('Category', 'Water higienis'),
                  _buildDetailRow('Status', 'Cancel Order'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Item',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            _buildItemRow('Kekeruhan', '1x', 'Rp. 50.000,00'),
            _buildItemRow('Kekeruhan', '1x', 'Rp. 50.000,00'),
            Divider(),
            _buildSummaryRow('Total Discount', 'Rp. 31.250,00'),
            _buildSummaryRow('Tax Rate', '11%'),
            _buildSummaryRow('Total Taxrate', 'Rp. 4.125,00'),
            _buildSummaryRow('Total Amount', 'Rp. 104.062,00'),
            SizedBox(height: 16),
            Text(
              'Notes:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '1. Penawaran harga berlaku 30 hari sejak tanggal penawaran.\n'
              '2. Pembayaran dilakukan maksimal 30 hari kalender setelah dokumen invoice diterima dengan lengkap dan benar.\n'
              '3. Lead Time Analysis 16 hari kerja untuk laporan hasil uji (LHU).',
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle download PDF
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Download PDF', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700]),
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow(String item, String quantity, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
          Text(
            quantity,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          SizedBox(width: 16),
          Text(
            amount,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
