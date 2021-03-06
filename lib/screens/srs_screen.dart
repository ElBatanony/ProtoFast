import 'package:flutter/material.dart';
import 'package:protofast/models/project.dart';

class SrsScreen extends StatelessWidget {
  final Project project;
  const SrsScreen({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Requirements Specifications"),
      ),
      body: Center(
        child: Column(
          children: [
            project.generateSRS(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Features'),
            ),
          ],
        ),
      ),
    );
  }
}
