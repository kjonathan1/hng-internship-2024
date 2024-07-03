import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/article_widget.dart';

class ListArticleScreen extends StatefulWidget {
  final List<Map<String, dynamic>> articles;
  final Function(String id, bool isChecked) onArticleChecked;

  const ListArticleScreen(
      {super.key, required this.articles, required this.onArticleChecked});

  @override
  State<ListArticleScreen> createState() => _ListArticleScreenState();
}

class _ListArticleScreenState extends State<ListArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      childAspectRatio: 0.75,
      padding: const EdgeInsets.all(20),
      children: [
        for (var article in widget.articles)
          ArticleWidget(
            id: article['id'],
            name: article['name'],
            price: article['price'],
            imageUrl: article['imageUrl'],
            isChecked: article['isChecked'],
            onChanged: (isChecked) =>
                widget.onArticleChecked(article['id'], isChecked),
          ),
      ],
    );
  }
}
