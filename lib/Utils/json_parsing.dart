import 'package:hakernews/src/articles.dart';
import 'dart:convert' as json;

List<int> parseTopStories(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  final listOfIds = List<int>.from(parsed);
  return listOfIds;
}

Article parseArticle(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  Article article = Article.fromJson(parsed);
  return article;
}
