import 'package:flutter/material.dart';

class Article {
  final String imageUrl;
  final String name;
  final double price;
  bool isChecked;

  Article({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.isChecked = false,
  });
}

void main(List<String> args) {
  Article a = Article(imageUrl: "assets/car.png", name: "car", price: 12.0);

  runApp(MyApp(
    article: a,
  ));
}

class MyApp extends StatefulWidget {
  final Article article;
  const MyApp({super.key, required this.article});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Card(
          elevation: 4.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Image.network(
                  widget.article.imageUrl,
                  width: double.infinity,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.article.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '\$${widget.article.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            widget.article.isChecked ? 'Checked' : 'Unchecked'),
                        Checkbox(
                          value: widget.article.isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              widget.article.isChecked = value ?? false;
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
        ),
      ),
    );
  }
}
