import 'package:dio/dio.dart';
import 'package:news_wave/utils/env.dart';

import '../models/news_model.dart';

class NewsService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org/'));

  Future<News> getNews(String country, String category) async {
    try {
      final queryParams = {
        'country': country,
        'category': category,
        'apiKey': Env.myApiKey,
      };
      final response =
          await _dio.get('v2/top-headlines', queryParameters: queryParams);
      return News.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting news');
    }
  }

  Future<News> searchNews(String query) async {
    try {
      final queryParams = {
        'q': query,
        'apiKey': '172e5dfdc8c743c28c2db8d3d32037dd',
      };

      final response =
          await _dio.get('v2/everything', queryParameters: queryParams);

      return News.fromJson(response.data);
    } catch (e) {
      throw Exception('Error searching news');
    }
  }
}
