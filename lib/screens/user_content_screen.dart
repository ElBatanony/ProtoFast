import 'package:flutter/material.dart';
import 'package:protofast/features/user_content/photos.dart';
import 'package:protofast/features/user_content/videos.dart';
import 'package:protofast/screens/feature_screen.dart';

class UserContentScreen extends StatelessWidget {
  const UserContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Content"),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FeatureScreen(feature: Videos())),
                  );
                },
                child: const Text(
                  'Videos',
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                )))),
            Container(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FeatureScreen(feature: Photos())),
                  );
                },
                child: const Text('Photos'),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                )))),
          ],
        ),
      ),
    );
  }
}
