import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/cubit/cubit/app_cubit.dart';
import 'package:news_wave/ui/home/pages/home_layout.dart';
import 'package:news_wave/ui/home/widgets/home_app_bar.dart';
import 'package:news_wave/ui/search/pages/search_page.dart';
import 'package:news_wave/utils/utils.dart';

import '../../../repository/news_repository.dart';
import '../cubit/news_cubit.dart';
import '../widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsCubit(newsRepository: context.read<NewsRepository>())
            ..getArticles(),
      child: Scaffold(
        appBar: HomeAppBar(
            title: 'News Wave',
            modeCallback: () {
              context.read<AppCubit>().changeMode();
            },
            searchCallback: () {
              navigateTo(context, const SearchPage());
            }),
        drawer: const DrawerWidget(),
        body: const HomeLayout(),
      ),
    );
  }
}
