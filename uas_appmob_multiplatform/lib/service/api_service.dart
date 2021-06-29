import 'dart:convert';

import 'package:http/http.dart';
import 'package:uas_appmob_multiplatform/model/news.dart';

class ApiService {
  final endPointURL = "https://jaroji.web.id/api/news.php";

  Future<List<News>> fetchNews() async {
    final response = await get(Uri.tryParse(endPointURL));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['berita'];

      List<News> news = body.map((item) => News.fromJSON(item)).toList();

      return news;
    } else {
      throw Exception("${response.statusCode} Can't get the News!");
    }
  }
}
