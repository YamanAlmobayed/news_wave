import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/ui/search/cubit/search_cubit.dart';
import 'package:news_wave/ui/search/widgets/search_articles_widget.dart';

import '../../widgets/default_formfield.dart';

class SearchLayout extends StatelessWidget {
  SearchLayout({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DefaultFormField(
              controller: context.read<SearchCubit>().searchController,
              type: TextInputType.text,
              label: 'Search',
              prefix: Icons.search,
              onSubmit: (query) {
                if (_formKey.currentState!.validate()) {
                  context.read<SearchCubit>().searchNews(query);
                }
              },
              validate: (value) {
                if (value.isEmpty) {
                  return 'Search must not be empty';
                }
                return null;
              },
            ),
          ),
          const Expanded(child: SearchArticlesWidget())
        ],
      ),
    );
  }
}
