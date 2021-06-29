import 'package:flutter/material.dart';
import 'package:uas_appmob_multiplatform/model/news.dart';
import 'package:uas_appmob_multiplatform/service/api_service.dart';
import 'package:uas_appmob_multiplatform/widget/list_tile.dart';

class HomeView extends StatefulWidget {
  final News news;

  const HomeView({Key key, this.news}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<News>> news;

  @override
  void initState() {
    super.initState();
    news = ApiService().fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('AISYA ANWAR PUTRI'),
      ),
      body: FutureBuilder(
        future: news,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<News> listNews = snapshot.data;
            return ListView.builder(
              itemCount: listNews.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => customListTile(listNews[index]),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
