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
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.imageUrl != null
              ? Image.network(widget.imageUrl!,
                  fit: BoxFit.cover, width: double.infinity, height: 150)
              : Container(
                  height: 150,
                  color: Colors.grey,
                  child:
                      const Icon(Icons.image, size: 100, color: Colors.white),
                ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$${widget.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 10),
                if (widget.onChanged != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.isChecked ? 'Checked' : 'Unchecked',
                        style: TextStyle(
                          fontSize: 14,
                          color: widget.isChecked ? Colors.green : Colors.red,
                        ),
                      ),
                      Checkbox(
                        value: widget.isChecked,
                        onChanged: (value) {
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
