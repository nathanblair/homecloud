import 'package:code_repository/shell/nav/callback.dart';
import 'package:code_repository/shell/nav/style.dart';
import 'package:code_repository/views/home/form.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const label = "Home";
  static const icon = Icon(Icons.home_outlined);
  static const selectedIcon = Icon(Icons.home_sharp);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: const Text(label),
      icon: icon,
      style: navBarButtonStyle,
      // selectedIcon: selectedIcon,
      onPressed: () => drawerPressCallback(const HomeView(), context),
    );
  }
}