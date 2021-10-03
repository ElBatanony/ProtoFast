import 'package:flutter/material.dart';
import 'package:protofast/screens/projects_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ProtoFast',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const ProjectsScreen());
  }
}
