// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class NewsModel {
  Map? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  NewsModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String,dynamic> json ){
    return NewsModel(
            source: json["source"] ?? "no sourc",
            author: json["author"] ?? "no auther",
            title: json["title"] ?? "no title",
            description: json["description"] ?? "no desc",
            url: json["url"] ?? "no url",
            urlToImage: json["urlToImage"] ?? "no Image",
            publishedAt: json["publishedAt"] ?? "no date",
            content: json["content"] ?? "no content");
  }
}
