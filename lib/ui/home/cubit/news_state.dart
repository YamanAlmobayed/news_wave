part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class GetNewsLoading extends NewsState {}

final class GetNewsSuccessful extends NewsState {
  GetNewsSuccessful(this.articles);

  final List<Article> articles;
}

final class GetNewsFailure extends NewsState {
  final String errorMessage;

  GetNewsFailure(this.errorMessage);
}
