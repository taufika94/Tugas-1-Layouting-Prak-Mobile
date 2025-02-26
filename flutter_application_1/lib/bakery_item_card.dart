import 'package:flutter/material.dart';

class BakeryItemCard extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final String itemPrice;

  BakeryItemCard({
    required this.imagePath,
    required this.itemName,
    required this.itemPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Menambahkan shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      margin: EdgeInsets.symmetric(vertical: 8), // Margin antar card
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15),
            ), // Rounded top corners
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 120,
              width: 120,
            ), // Ukuran gambar
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              itemName,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(itemPrice, style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
