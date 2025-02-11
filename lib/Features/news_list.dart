import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

class NewsList extends StatefulWidget {
  NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<NewsModel> listOfarticales = [];
  bool isLoader = true;
  String? errorMessage ;

  void getNews() async {
    Dio dio = Dio();try{
    Response response = await dio.get(
        "https://newsapi.org/v2/everything?q=apple&from=2025-02-06&to=2025-02-06&sortBy=popularity&apiKey=6065290155eb4c81ab086901c6b90599");

    Map<String, dynamic> Apinews = response.data;
    List<dynamic> news = Apinews['articles'];
    List<NewsModel> listOfviews = [];

    for (var item in news) {
      NewsModel article = NewsModel(
          source: item["source"]??"no sourc",
          author: item["author"]??"no auther",
          title: item["title"]??"no title",
          description: item["description"]??"no desc",
          url: item["url"]??"no url",
          urlToImage: item["urlToImage"]?? "no Image",
          publishedAt: item["publishedAt"]?? "no date",
          content: item["content"]?? "no content");
      listOfviews.add(article);
    }
    setState(() {
      listOfarticales = listOfviews;
      isLoader = false;
    });}catch(err){
      setState(() {
            isLoader = false;
     errorMessage = err.toString();

      });
  }

  }

  @override
  void initState() {
    super.initState();

    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : errorMessage!=null?  Center(
              child:Text(errorMessage!),
            ) : ListView.builder(
              itemCount: listOfarticales.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                        tileColor: Colors.teal,
                        textColor: Colors.black,
                        title: Text(listOfarticales[index].title ?? "null")));
              }),
    );
  }
}
