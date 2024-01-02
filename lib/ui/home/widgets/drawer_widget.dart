import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_wave/cubit/cubit/app_cubit.dart';
import 'package:news_wave/utils/utils.dart';

import '../cubit/news_cubit.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 365.w,
        color: context.read<AppCubit>().isDark
            ? const Color(0xf0333739)
            : Colors.grey[350]!.withAlpha(240),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Builder(
              builder: (context) => Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Choose a country:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  ...context
                      .read<NewsCubit>()
                      .countries
                      .keys
                      .map((e) => TextButton(
                          onPressed: () {
                            context.read<NewsCubit>().country =
                                context.read<NewsCubit>().countries[e]!;
                          },
                          child: Text(e)))
                      .toList(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Choose a category:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  ...context
                      .read<NewsCubit>()
                      .categories
                      .map((e) => TextButton(
                          onPressed: () {
                            context.read<NewsCubit>().category = e;
                          },
                          child: Text(e.toTitleCase())))
                      .toList(),
                  SizedBox(
                    height: 20.h,
                  ),
                  OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => context.read<AppCubit>().isDark
                                ? Colors.grey.shade900
                                : Colors.grey.shade300),
                      ),
                      onPressed: () {
                        context.read<NewsCubit>().getArticles();
                      },
                      child: const Text(
                        'Submit',
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
