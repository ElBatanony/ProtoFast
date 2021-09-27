import 'package:flutter/material.dart';
import 'package:protofast/models/project.dart';

class SRSScreen extends StatelessWidget {
  final Project project;
  const SRSScreen({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Requirements Specifications"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Requirements Specification',
              style: TextStyle(fontSize: 36),
            ),
            project.generateSRS(),
            SizedBox(width: 16.0, height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
