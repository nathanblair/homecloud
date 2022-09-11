import 'package:code_repository/keys.dart';
import 'package:code_repository/scaffold.dart';
import 'package:code_repository/theme/dark.dart';
import 'package:code_repository/theme/light.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  final String title;

  const Application({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: title,
      theme: ThemeData.from(
        colorScheme: lightColorScheme,
        textTheme: lightTextTheme,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.from(
        colorScheme: darkColorScheme,
        textTheme: darkTextTheme,
        useMaterial3: true,
      ),
      home: const AppScaffold(),
    );
  }
}