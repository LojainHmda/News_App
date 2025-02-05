import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewsList extends StatefulWidget {
  NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

 getNews() async {
  Dio dio = Dio();
  Response response = await dio.get(
      "newsapi.org/v2/everything?q=tesla&from=2025-01-01&sortBy=publishedAt&apiKey=afe38ea1b2a94dcaa8fffa65c24d40f9");
      return response.data;
}

class _NewsListState extends State<NewsList> {
  List<dynamic> news = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
           news= getNews();
            return Card(child: ListTile(title: Text("News")));
          }),
    );
  }
}
