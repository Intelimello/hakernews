class Article {
  final String by;
  final int descendants;
  final int id;
  final List<dynamic> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  final String url;

  const Article({
    required this.by,
    required this.descendants,
    required this.id,
    required this.kids,
    required this.score,
    required this.time,
    required this.title,
    required this.type,
    required this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      by: json['by'],
      descendants: json['descendants'] ?? 0,
      id: json['id'] ?? 0,
      kids: json['kids'],
      score: json['score'] ?? 0,
      time: json['time'] ?? 0,
      title: json['title'],
      type: json['type'],
      url: json['url'],
    );
  }
}

final articles = [
  const Article(
      by: "dhouston",
      descendants: 71,
      id: 8863,
      kids: [
        8952,
        9224,
        8917,
        8884,
        8887,
        8943,
        8869,
        8958,
        9005,
        9671,
        8940,
        9067,
        8908,
        9055,
        8865,
        8881,
        8872,
        8873,
        8955,
        10403,
        8903,
        8928,
        9125,
        8998,
        8901,
        8902,
        8907,
        8894,
        8878,
        8870,
        8980,
        8934,
        8876
      ],
      score: 111,
      time: 1175714200,
      title: "My YC app: Dropbox - Throw away your USB drive",
      type: "story",
      url: "http://www.getdropbox.com/u/2/screencast.html"),
  const Article(
      by: "dhouston",
      descendants: 71,
      id: 8863,
      kids: [
        8952,
        9224,
        8917,
        8884,
        8887,
        8943,
        8869,
        8958,
        9005,
        9671,
        8940,
        9067,
        8908,
        9055,
        8865,
        8881,
        8872,
        8873,
        8955,
        10403,
        8903,
        8928,
        9125,
        8998,
        8901,
        8902,
        8907,
        8894,
        8878,
        8870,
        8980,
        8934,
        8876
      ],
      score: 111,
      time: 1175714200,
      title: "My YC app: Dropbox - Throw away your USB drive",
      type: "story",
      url: "http://www.getdropbox.com/u/2/screencast.html"),
  const Article(
      by: "dhouston",
      descendants: 71,
      id: 8863,
      kids: [
        8952,
        9224,
        8917,
        8884,
        8887,
        8943,
        8869,
        8958,
        9005,
        9671,
        8940,
        9067,
        8908,
        9055,
        8865,
        8881,
        8872,
        8873,
        8955,
        10403,
        8903,
        8928,
        9125,
        8998,
        8901,
        8902,
        8907,
        8894,
        8878,
        8870,
        8980,
        8934,
        8876
      ],
      score: 111,
      time: 1175714200,
      title: "My YC app: Dropbox - Throw away your USB drive",
      type: "story",
      url: "http://www.getdropbox.com/u/2/screencast.html"),
  const Article(
      by: "dhouston",
      descendants: 71,
      id: 8863,
      kids: [
        8952,
        9224,
        8917,
        8884,
        8887,
        8943,
        8869,
        8958,
        9005,
        9671,
        8940,
        9067,
        8908,
        9055,
        8865,
        8881,
        8872,
        8873,
        8955,
        10403,
        8903,
        8928,
        9125,
        8998,
        8901,
        8902,
        8907,
        8894,
        8878,
        8870,
        8980,
        8934,
        8876
      ],
      score: 111,
      time: 1175714200,
      title: "My YC app: Dropbox - Throw away your USB drive",
      type: "story",
      url: "http://www.getdropbox.com/u/2/screencast.html"),
];
