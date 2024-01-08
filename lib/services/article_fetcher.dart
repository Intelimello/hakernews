import 'package:hakernews/Utils/json_parsing.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final Uri topStoriesUri =
    Uri.http('https://hacker-news.firebaseio.com/v0/topstories.json');

Future topStories() async {
  final res = await http.get(topStoriesUri);
  if (res.statusCode == 200) {
    final List idList = json.decode(res.body);
    if (idList.isNotEmpty) {
      final Uri storyUrl = Uri.http(
          'https://hacker-news.firebaseio.com/v0/item/${idList.first}.json');
      final storyRes = await http.get(storyUrl);
      if (res.statusCode == 200) {
        return parseArticle(storyRes.body);
      }
    }
  }
}
