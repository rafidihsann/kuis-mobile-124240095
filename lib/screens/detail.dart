import 'package:flutter/material.dart';

import '../models/data.dart';

class DetailScreen extends StatelessWidget {
  final Shoe product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.shoeName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.shoeName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Text(product.category, style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 10),
            Text(
              product.price,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Jumlah Produk',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("${product.likes} Likes"),
            Text("Stok: ${product.stock}"),
            const SizedBox(height: 10),
            const Text('Ukuran', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text("Stok: ${product.sizes}"),
            const SizedBox(height: 12),
            const Text(
              'Deskripsi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(product.description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
