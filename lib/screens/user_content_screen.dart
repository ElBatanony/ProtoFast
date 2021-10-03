import 'package:flutter/material.dart';
import 'package:protofast/models/project.dart';

class UserContentScreen extends StatelessWidget {
  final Project project;
  const UserContentScreen({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Requirements Specifications"),
      ),
      body: Center(
        child: Column(
          children: const [
            Text("Videos", style: TextStyle(backgroundColor: Colors.blue)),
            Text("Photos")
          ],
        ),
      ),
    );
  }
}
