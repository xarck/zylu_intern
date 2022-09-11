import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zylu_intern/controllers/home_controller.dart';
import 'package:zylu_intern/views/home_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
