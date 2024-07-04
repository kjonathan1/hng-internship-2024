import 'package:flutter/material.dart';

class ArticleWidget extends StatefulWidget {
  final String id;
  final String name;
  final double price;
  final String? imageUrl;
  bool isChecked;
  final ValueChanged<bool>? onChanged;

  ArticleWidget({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl,
    this.isChecked = false,
    this.onChanged,
  });

  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: widget.imageUrl != null
                ? Image.asset("assets/${widget.imageUrl!}",
                    fit: BoxFit.cover, width: double.infinity, height: 150.0)
                : Container(
                    height: 150.0,
                    color: Colors.grey,
                    child: const Icon(Icons.image,
                        size: 100.0, color: Colors.white),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '\$${widget.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.isChecked ? 'Checked' : 'Unchecked'),
                    Checkbox(
                      value: widget.isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          widget.isChecked = value ?? false;
                          widget.onChanged!(widget.isChecked);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
