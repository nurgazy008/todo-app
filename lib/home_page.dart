import 'package:flutter/material.dart';
import 'package:flutter_application_9/wourkout_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("MaxFit"),
        leading: Icon(Icons.fitness_center),
      ),
      body: WourkoutList(),
    );
  }
}
