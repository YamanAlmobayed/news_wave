import 'package:news_wave/repository/models/article_model.dart';
import 'package:news_wave/repository/services/news_service.dart';

class NewsRepository {
  NewsRepository({required this.newsService});
  final NewsService newsService;

  Future<List<Article>> getArticles(String country, String category) async {
    final news = await newsService.getNews(country, category);
    return news.articles;
  }

  Future<List<Article>> searchNews(String query) async {
    final news = await newsService.searchNews(query);
    return news.articles;
  }
}
