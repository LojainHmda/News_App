import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';

class NewsServices { 
  Dio dio = Dio();

   
   Future<List<NewsModel>> getNewsService(String selectedCategory ) async {
    Response response = await dio.get(
        "https://newsapi.org/v2/everything?q=$selectedCategory&from=2025-02-06&to=2025-02-06&sortBy=popularity&apiKey=6065290155eb4c81ab086901c6b90599");

    Map<String, dynamic> Apinews = response.data;
    List<dynamic> news = Apinews['articles'];
    List<NewsModel> listOfnews = [];

    for (var item in news) {
      listOfnews.add(NewsModel.fromJson(item));
    }
    return listOfnews;
  }
}
