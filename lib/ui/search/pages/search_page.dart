import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/repository/news_repository.dart';
import 'package:news_wave/ui/search/cubit/search_cubit.dart';
import 'package:news_wave/ui/search/pages/search_layout.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            SearchCubit(newsRepository: context.read<NewsRepository>()),
        child: SearchLayout(),
      ),
    );
  }
}
