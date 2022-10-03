import 'package:flutter/material.dart';

import 'core/core.dart';
import 'modules/modules.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeApp.theme,
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => const GithubReposScreen(),
        },
        initialRoute: '/home',
      );
}
