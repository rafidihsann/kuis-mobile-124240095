import 'package:flutter/material.dart';

import '../models/data.dart';
import 'detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Semua';

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Semua',
      ...shoeCatalog.map((Shoe) => Shoe.category).toSet(),
    ];
    final filteredshoeCatalog = _selectedCategory == 'Semua'
        ? shoeCatalog
        : shoeCatalog
              .where((Shoe) => Shoe.category == _selectedCategory)
              .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: DropdownButtonFormField<String>(
            initialValue: _selectedCategory,
            decoration: const InputDecoration(
              labelText: 'Kategori',
              prefixIcon: Icon(Icons.filter_list),
              border: OutlineInputBorder(),
              isDense: true,
            ),
            items: categories
                .map(
                  (category) =>
                      DropdownMenuItem(value: category, child: Text(category)),
                )
                .toList(),
            onChanged: (category) {
              if (category != null) {
                setState(() => _selectedCategory = category);
              }
            },
          ),
        ),
        Expanded(
          child: filteredshoeCatalog.isEmpty
              ? const Center(child: Text('Kategori tidak ditemukan'))
              : ListView.builder(
                  itemCount: filteredshoeCatalog.length,
                  itemBuilder: (context, index) {
                    final Shoe = filteredshoeCatalog[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(product: Shoe),
                          ),
                        );
                      },
                      title: Text(Shoe.shoeName),
                      subtitle: Text('${Shoe.price}'),
                      leading: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Image.network(Shoe.image),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
