import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_services.dart';

class NewsList extends StatefulWidget {
  NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  String selectedCategory = "general";
  List<NewsModel> listOfarticales = [];
  bool isLoader = true;
  String? errorMessage;
  final NewsServices newservices =NewsServices();
  final List<String> category = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];

  void getNews() async {
   List<NewsModel> listOfnews = [];
  try {listOfnews = await newservices.getNewsService(selectedCategory) ;
      setState(() {
        listOfarticales = listOfnews;
        isLoader = false;
      });
    } catch (err) {
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
      appBar: AppBar(
        title: Text("News App"),
        actions: [
          DropdownButton(
              icon: Icon(Icons.arrow_drop_down),
              items: category.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    selectedCategory = value;
                  }
                });
                getNews();
              })
        ],
      ),
      body: isLoader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : errorMessage != null
              ? Center(
                  child: Text(errorMessage!),
                )
              : ListView.builder(
                  itemCount: listOfarticales.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                            tileColor: Colors.teal,
                            textColor: Colors.black,
                            title:
                                Text(listOfarticales[index].title ?? "null")));
                  }),
    );
  }
}
