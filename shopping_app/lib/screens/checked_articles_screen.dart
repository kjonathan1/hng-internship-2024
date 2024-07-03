import "package:flutter/material.dart";
import "package:shopping_app/widgets/article_widget.dart";

class CheckedArticlesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> articles;
  final VoidCallback resetArticles;

  const CheckedArticlesScreen(
      {super.key, required this.articles, required this.resetArticles});

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
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                  double.infinity, 60), // Full width and height of 60
              padding: const EdgeInsets.symmetric(vertical: 20),
              textStyle: const TextStyle(fontSize: 18),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Payment Successful!'),
                  backgroundColor: Colors.green,
                ),
              );

              resetArticles();
            },
            child: const Text('Pay'),
          ),
        ),
      ],
    );
  }
}
