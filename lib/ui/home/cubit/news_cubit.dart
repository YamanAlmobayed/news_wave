import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_wave/repository/news_repository.dart';

import '../../../repository/models/article_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit({required this.newsRepository}) : super(NewsInitial());

  final NewsRepository newsRepository;

  String country = 'us';

  String category = 'sports';

  void getArticles() async {
    emit(GetNewsLoading());
    try {
      final articles = await newsRepository.getArticles(country, category);
      emit(GetNewsSuccessful(articles));
    } catch (e) {
      emit(GetNewsFailure(e.toString()));
    }
  }

  final countries = {
    'USA': 'us',
    'UAE': 'ae',
    'Egypt': 'eg',
    'Italy': 'lt',
    'Canada': 'ca'
  };

  final categories = [
    'business',
    'entertainment',
    'generalhealth',
    'science',
    'sports',
    'technology'
  ];
}
