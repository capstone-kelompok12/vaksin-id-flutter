import 'package:dio/dio.dart';
import 'package:vaksin_id_flutter/models/home/news_model.dart';

class NewsService {
  Future<List<NewsModel>> getAllNews() async {
    const String baseUrl =
        'https://newsapi.org/v2/everything?q=covid&language=id&apiKey=23b92eb137c74f6eab5f15055aa1de69';
    final dio = Dio();
    var response = await dio.get(baseUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['articles'];
      return data.map((item) => NewsModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load character');
    }
  }
}