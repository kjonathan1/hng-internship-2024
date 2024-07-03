import 'package:flutter/material.dart';
import 'package:shopping_app/screens/checked_articles_screen.dart';
import 'package:shopping_app/screens/list_article_creen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  List<Map<String, dynamic>> articles = [
    {
      'id': '1',
      'name': 'Tower',
      'price': 20,
      'isChecked': false,
    },
    {
      'id': '2',
      'name': 'Car',
      'price': 200,
      'isChecked': false,
    },
    {
      'id': '3',
      'name': 'Snaks',
      'price': 2,
      'isChecked': false,
    },
    {
      'id': '4',
      'name': 'Soda',
      'price': 5,
      'isChecked': false,
    },
    {
      'id': '5',
      'name': 'Watch',
      'price': 70,
      'isChecked': false,
    },
    {
      'id': '6',
      'name': 'Laptop',
      'price': 150,
      'isChecked': false,
    },
    {
      'id': '7',
      'name': 'Bike',
      'price': 175,
      'isChecked': false,
    },
    {
      'id': '8',
      'name': 'Phone',
      'price': 50,
      'isChecked': false,
    },
    {
      'id': '9',
      'name': 'Glaces',
      'price': 10,
      'isChecked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      ListArticleScreen(
        articles: articles,
        onArticleChecked: (id, isChecked) {
          setState(() {
            final index = articles.indexWhere((article) => article['id'] == id);
            if (index != -1) {
              articles[index]['isChecked'] = isChecked;
            }
          });
        },
      ),
      CheckedArticlesScreen(
        articles:
            articles.where((article) => article['isChecked'] == true).toList(),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Shopping Mall")),
        elevation: 5,
      ),
      body: SafeArea(child: pages[pageIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) => setState(() {
          pageIndex = value;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist_outlined), label: 'Checked'),
        ],
      ),
    );
  }
}
