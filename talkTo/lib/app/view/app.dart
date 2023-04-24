import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talk_to/l10n/l10n.dart';

import '../theme/app_theming.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'TalkTo',
      theme: AppThemeData.lightThemeData,
      themeMode: ThemeMode.light,
      darkTheme: AppThemeData.darkThemeData,
      home: Container(),
    );
  }
}
