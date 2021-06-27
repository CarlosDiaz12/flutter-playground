import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Playground'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ArticleWidget(Article(title: 'title', body: 'body')),
          ),
        ),
      ),
    );
  }
}

class ArticleWidget extends StatelessWidget {
  final Article article;

  ArticleWidget(this.article);

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Text(article.title),
      collapsed: Text(
        article.body,
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      expanded: Text(
        article.body,
        softWrap: true,
      ),
    );
  }
}

class Article {
  final String title;
  final String body;
  Article({
    required this.title,
    required this.body,
  });
}
