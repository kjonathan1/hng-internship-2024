import 'package:flutter/material.dart';

class ProductTemplate extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final double price;
  final double? stockQty;
  final bool? isAvailable;
  final String? currensy;

  const ProductTemplate(
      {super.key,
      required this.name,
      required this.price,
      this.imageUrl,
      this.stockQty,
      this.isAvailable,
      this.currensy});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Price: ${price.toString()} $currensy",
              style: const TextStyle(color: Colors.black)),
          isAvailable!
              ? const Text("Available", style: TextStyle(color: Colors.green))
              : const Text("Unavailable", style: TextStyle(color: Colors.red))
        ],
      ),
      leading: ClipOval(
        child: imageUrl != null
            ? Image.network(
                imageUrl!,
                width: 75,
                height: 150,
                fit: BoxFit.cover,
              )
            : const Icon(
                Icons.image,
                size: 100,
              ),
      ),
    );
  }
}
