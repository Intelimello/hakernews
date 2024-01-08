import 'package:hakernews/Utils/json_parsing.dart';
import 'package:hakernews/src/articles.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'dart:collection';
import 'package:http/http.dart' as http;

class HackerNewsBloc {
  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;

  final _articlesSubject = BehaviorSubject<List<Article>>();

  var _articles = <Article>[];

  HackerNewsBloc() {
    _updateArticles()
        .then((_) => {_articlesSubject.add(UnmodifiableListView(_articles))});
  }

  final List<int> _ids = [
    38769850,
    38772382,
    38772980,
    38773203,
    38773429,
    38769700,
    38769874,
    38770168,
    38773177,
    38773426,
    38773037,
    38769827,
    38771513,
  ];

  Future<Null> _updateArticles() async {
    final futureArticles = _ids.map((e) => _getArticle(e));
    final articles = await Future.wait(futureArticles);
    _articles = articles;
  }

  Future<Article> _getArticle(int id) async {
    final Uri storyUrl =
        Uri.http('https://hacker-news.firebaseio.com/v0/item/${id}.json');
    final storyRes = await http.get(storyUrl);
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
  }
}
