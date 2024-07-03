import "package:flutter/material.dart";
import "package:shopping_app/widgets/article_widget.dart";

class CheckedArticlesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> articles;

  const CheckedArticlesScreen({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return ArticleWidget(
                id: article['id'],
                name: article['name'],
                price: article['price'],
                imageUrl: article['imageUrl'],
                isChecked: article['isChecked'],
                onChanged: null, // Read-only, no changes allowed
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Payment Successful!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Pay'),
          ),
        ),
      ],
    );
  }
}
