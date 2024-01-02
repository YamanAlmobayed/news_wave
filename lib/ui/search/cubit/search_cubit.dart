import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/repository/news_repository.dart';

import '../../../repository/models/article_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.newsRepository}) : super(SearchInitial());
  final NewsRepository newsRepository;

  void searchNews(String query) async {
    emit(SearchLoading());
    try {
      final articles = await newsRepository.searchNews(query);
      emit(SearchSuccess(articles));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  TextEditingController get searchController => TextEditingController();

  GlobalKey<FormState> get formKey => GlobalKey<FormState>();
}
