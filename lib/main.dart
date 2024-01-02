import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_wave/cubit/cubit/app_cubit.dart';
import 'package:news_wave/repository/news_repository.dart';
import 'package:news_wave/repository/services/news_service.dart';
import 'package:news_wave/ui/home/pages/home_page.dart';
import 'package:news_wave/ui/style/themes.dart';
import 'package:news_wave/utils/bloc_observer.dart';
import 'package:news_wave/utils/cache_helper.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.inti();
  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({
    super.key,
    this.isDark,
  });
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NewsRepository(newsService: NewsService()),
      child: BlocProvider(
        create: (context) => AppCubit()..changeMode(fromShared: isDark),
        child: Builder(
          builder: (context) => ScreenUtilInit(
            designSize: const Size(737, 392),
            minTextAdapt: true,
            builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppStyle().lightTheme,
              darkTheme: AppStyle().darkTheme,
              themeMode: context.watch<AppCubit>().isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: child,
            ),
            child: const HomePage(),
          ),
        ),
      ),
    );
  }
}
