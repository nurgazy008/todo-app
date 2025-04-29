import 'package:flutter/material.dart';
import 'package:flutter_application_9/author.dart';
import 'package:flutter_application_9/home_page.dart';
import 'domain/wourkout.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Author());
  }
}
