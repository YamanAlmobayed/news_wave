import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/article_widget.dart';
import '../../widgets/default_separator.dart';
import '../cubit/news_cubit.dart';

class HomeArticlesWidget extends StatelessWidget {
  const HomeArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is GetNewsSuccessful) {
          return ListView.separated(
            cacheExtent: 5000,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => ArticleItem(
              article: state.articles[index],
            ),
            separatorBuilder: (context, index) => const DefaultSeparator(),
            itemCount: state.articles.length,
          );
        } else if (state is GetNewsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetNewsFailure) {
          return ScaffoldMessenger(child: Text(state.errorMessage));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
