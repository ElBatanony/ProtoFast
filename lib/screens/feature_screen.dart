import 'package:flutter/material.dart';
import 'package:protofast/models/feature.dart';

class FeatureScreen extends StatelessWidget {
  final Feature feature;
  const FeatureScreen({Key? key, required this.feature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feature"),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            feature.featureWidget(),
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
