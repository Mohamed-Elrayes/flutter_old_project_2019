import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provide;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'data/models/generate/bookmark_hive/bookmark_item.dart';
import 'data/repositories/repositories.dart';

import 'core/core.dart';
import 'logic/bloc/articles/articles_bloc.dart';
import 'logic/bloc/auth/auth_bloc.dart';
import 'logic/cubit/bookmark/bookmark_cubit.dart';
import 'logic/cubit/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authRepository = AuthRepository();

  Directory directory = await path_provide.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(BookmarkHiveAdapter());
  // await Hive.openBox<BookmarkHive>('bookmark');
// var path = Directory.current.path;
//   Hive
//     ..init(path)
//     ..registerAdapter(PersonAdapter());
  // debugRepaintRainbowEnabled = true;
  runApp(MyApp(authRepository: authRepository));
  // BlocOverrides.runZoned(
  //   () {
  // debugRepaintRainbowEnabled = true;
  //     runApp(MyApp(authRepository: authRepository));
  //   },
  //   blocObserver: AppBlocObserver(),
  //   // DevicePreview(
  //   //   enabled: true,
  //   //   builder: (context) {
  //   //     return const MyApp();
  //   //   },
  //   // ),
  // );
}

class MyApp extends StatelessWidget {
  final AuthRepository _authRepository;
  const MyApp({
    Key? key,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => AuthBloc(_authRepository)..add(AuthenticationStarted())),
          BlocProvider(
              create: (context) => ArticlesBloc()
                ..add(ArticlesFetch(categoryName: kindArticles[0].headLine))),
          BlocProvider(create: (context) => BookmarkCubit()..getBookmarks()),
        ],
        child: const NewsApp(),
      ),
    );
  }
}

class NewsApp extends StatelessWidget {
  const NewsApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: DevicePreview.appBuilder,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: context.select((ThemeCubit value) => value.state.themeMode),
      title: 'Newsly app',
      onGenerateInitialRoutes: RouteGenerator.generateInitialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
