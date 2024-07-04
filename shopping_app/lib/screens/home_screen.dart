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
      'name': 'Towel',
      'price': 20.0,
      'isChecked': false,
      'imageUrl': "towel.png",
    },
    {
      'id': '2',
      'name': 'Car',
      'price': 200.0,
      'isChecked': false,
      'imageUrl': "car.png",
    },
    {
      'id': '3',
      'name': 'Snacks',
      'price': 2.0,
      'isChecked': false,
      'imageUrl': "snacks.png",
    },
    {
      'id': '4',
      'name': 'Soda',
      'price': 5.0,
      'isChecked': false,
      'imageUrl': "soda.png",
    },
    {
      'id': '5',
      'name': 'Watch',
      'price': 70.0,
      'isChecked': false,
      'imageUrl': "watch.png",
    },
    {
      'id': '6',
      'name': 'Laptop',
      'price': 150.0,
      'isChecked': false,
      'imageUrl': "laptop.png",
    },
    {
      'id': '7',
      'name': 'Bike',
      'price': 175.0,
      'isChecked': false,
      'imageUrl': "bike.png",
    },
    {
      'id': '8',
      'name': 'Phone',
      'price': 50.0,
      'isChecked': false,
      'imageUrl': "phone.png",
    },
    {
      'id': '9',
      'name': 'Glaces',
      'price': 10.0,
      'isChecked': false,
      'imageUrl': "glace.png",
    },
  ];

  void resetArticles() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        for (var article in articles) {
          article['isChecked'] = false;
        }
        pageIndex = 0; // Navigate back to the home page
      });
    });
  }

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
        resetArticles: resetArticles,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Shopping Mall")),
        elevation: 5.0,
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
