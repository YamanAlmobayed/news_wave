import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/ui/search/cubit/search_cubit.dart';

import '../../widgets/article_widget.dart';
import '../../widgets/default_separator.dart';

class SearchArticlesWidget extends StatelessWidget {
  const SearchArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => ArticleItem(
              article: state.articles[index],
            ),
            separatorBuilder: (context, index) => const DefaultSeparator(),
            itemCount: state.articles.length,
          );
        } else if (state is SearchInitial) {
          return const SizedBox.shrink();
        } else if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchError) {
          return ScaffoldMessenger(child: Text(state.errorMessage));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
