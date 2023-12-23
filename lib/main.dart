import 'package:flutter/material.dart';
import 'package:hakernews/src/articles.dart';
import 'package:url_launcher/url_launcher.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<Article> _article = articles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
          article.text,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${article.commentsCount} comments...",
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
        //onTap: () async {
        //
        //  }
        //},
      ),
    );
  }
}
