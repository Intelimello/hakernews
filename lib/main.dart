import 'package:flutter/material.dart';
import 'package:hakernews/Utils/json_parsing.dart';
import 'package:hakernews/src/articles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hakernews/services/article_fetcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hacker News'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Article> _article = [
    parseArticle(
        """{"by":"dhouston","descendants":71,"id":8863,"kids":[9224,8917,8884,8887,8952,8869,8873,8958,8940,8908,9005,9671,9067,9055,8865,8881,8872,8955,10403,8903,8928,9125,8998,8901,8902,8907,8894,8870,8878,8980,8934,8943,8876],"score":104,"time":1175714200,"title":"My YC app: Dropbox - Throw away your USB drive","type":"story","url":"http://www.getdropbox.com/u/2/screencast.html"}""")
  ];
  List<Article> _asyncArticle = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () async {
                _asyncArticle = await topStories();
                print(_asyncArticle);
                setState(() {
                  _article = _asyncArticle;
                });
              },
              icon: const Icon(Icons.view_cozy))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Refreshed')));
        },
        child: ListView(
          children: _article.map(_buildItem).toList(),
        ),
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
          article.title,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${article.score} comments...",
                style: const TextStyle(fontSize: 20.0),
              ),
              IconButton(
                  icon: const Icon(Icons.launch),
                  onPressed: () async {
                    if (await canLaunchUrl(_url)) {
                      launchUrl(_url);
                    }
                  })
            ],
          ),
        ],
      ),
    );
  }
}
