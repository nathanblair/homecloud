import 'package:code_repository/scaffold.dart';
import 'package:code_repository/theme/default.dart';
import 'package:flutter/material.dart';

import 'login/login.dart';

MaterialApp build(String title, GlobalKey<NavigatorState> navigatorKey) {
  const LoginWidget login = LoginWidget();

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    // debugShowMaterialGrid: true,
    navigatorKey: navigatorKey,
    title: title,
    theme: defaultTheme,
    themeMode: ThemeMode.system,
    home: const AppScaffold(body: login),
  );
}
