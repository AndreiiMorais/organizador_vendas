import 'package:flutter/material.dart';
import 'package:organizador_vendas/pages/edit_page.dart';
import 'package:organizador_vendas/pages/homepage.dart';
import 'package:organizador_vendas/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/edit': (context) => EditPage(),
      },
    );
  }
}
