import 'package:flutter/material.dart';

class PurchaseOrderDetailPage extends StatelessWidget {
  const PurchaseOrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Purchase Order',
          style: TextStyle(
            color: Colors.green,
            fontSize: screenWidth * 0.045, // Responsif
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: screenWidth * 0.05, // Responsif
            ),
          ),
          SizedBox(width: screenWidth * 0.04), // Responsif
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04), // Responsif
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.04), // Responsif
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(screenWidth * 0.02), // Responsif
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Image.asset(
                          'assets/images/logo_login.png',
                          height: screenWidth * 0.15, // Responsif berdasarkan lebar layar
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.04), // Responsif
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PT. Chemviro Buana Indonesia',
                              style: TextStyle(
                                fontSize: screenWidth * 0.045, // Responsif
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              'Head Office',
                              style: TextStyle(
                                fontSize: screenWidth * 0.035, // Responsif
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.04), // Responsif
                  _buildDetailRow('Order Number', 'SO-000001', screenWidth),
                  _buildDetailRow('Client', 'PT. Ada AQUA', screenWidth),
                  _buildDetailRow('Address', 'Jl. terus pantang mundur', screenWidth),
                  _buildDetailRow('Email', 'ptadaaqua@gmail.com', screenWidth),
                  _buildDetailRow('Phone', '081487226637', screenWidth),
                  _buildDetailRow('Product', 'Analisis Air', screenWidth),
                  _buildDetailRow('Category', 'Water higienis', screenWidth),
                  _buildDetailRow('Status', 'Purchase Order', screenWidth),
                ],
              ),
            ),
            SizedBox(height: screenWidth * 0.04), // Responsif
            Text(
              'Item',
              style: TextStyle(
                fontSize: screenWidth * 0.045, // Responsif
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: screenWidth * 0.02), // Responsif
            _buildItemRow('Kekeruhan', '1x', 'Rp. 50.000,00', screenWidth),
            _buildItemRow('Kekeruhan', '1x', 'Rp. 50.000,00', screenWidth),
            Divider(),
            _buildSummaryRow('Total Discount', 'Rp. 31.250,00', screenWidth),
            _buildSummaryRow('Tax Rate', '11%', screenWidth),
            _buildSummaryRow('Total Taxrate', 'Rp. 4.125,00', screenWidth),
            _buildSummaryRow('Total Amount', 'Rp. 104.062,00', screenWidth),
            SizedBox(height: screenWidth * 0.04), // Responsif
            Text(
              'Notes:',
              style: TextStyle(
                fontSize: screenWidth * 0.04, // Responsif
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: screenWidth * 0.02), // Responsif
            Text(
              '1. Penawaran harga berlaku 30 hari sejak tanggal penawaran.\n'
              '2. Pembayaran dilakukan maksimal 30 hari kalender setelah dokumen invoice diterima dengan lengkap dan benar.\n'
              '3. Lead Time Analysis 16 hari kerja untuk laporan hasil uji (LHU).',
              style: TextStyle(
                fontSize: screenWidth * 0.035, // Responsif
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: screenWidth * 0.04), // Responsif
            ElevatedButton(
              onPressed: () {
                // Handle download PDF
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02), // Responsif
                ),
                minimumSize: Size(double.infinity, screenWidth * 0.12), // Responsif
              ),
              child: Text(
                'Download PDF',
                style: TextStyle(
                  fontSize: screenWidth * 0.04, // Responsif
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01), // Responsif
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.035, // Responsif
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: screenWidth * 0.035, // Responsif
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow(
      String item, String quantity, String amount, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01), // Responsif
      child: Row(
        children: [
          Expanded(
            child: Text(
              item,
              style: TextStyle(
                fontSize: screenWidth * 0.035, // Responsif
                color: Colors.black87,
              ),
            ),
          ),
          Text(
            quantity,
            style: TextStyle(
              fontSize: screenWidth * 0.035, // Responsif
              color: Colors.black87,
            ),
          ),
          SizedBox(width: screenWidth * 0.04), // Responsif
          Text(
            amount,
            style: TextStyle(
              fontSize: screenWidth * 0.035, // Responsif
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
      String label, String value, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01), // Responsif
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.035, // Responsif
                color: Colors.grey[700],
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: screenWidth * 0.035, // Responsif
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
