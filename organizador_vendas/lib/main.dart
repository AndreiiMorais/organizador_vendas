import 'package:flutter/material.dart';
import 'package:organizador_vendas/pages/edit_page.dart';
import 'package:organizador_vendas/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primaryColor: Colors.blue.shade900,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/edit': (context) => EditPage(),
      },
    );
  }
}
