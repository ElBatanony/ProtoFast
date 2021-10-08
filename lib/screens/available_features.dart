import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protofast/features/user_content/user_content.dart';
import 'package:protofast/features/user_login.dart';
import 'package:protofast/features/user_profile.dart';
import 'package:protofast/models/feature.dart';
import 'package:protofast/models/project.dart';
import 'package:protofast/screens/feature_screen.dart';
import 'package:protofast/screens/user_content_screen.dart';

class AvailableFeaturesScreen extends StatelessWidget {
  final Project project;

  const AvailableFeaturesScreen({Key? key, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Features"),
      ),
      body: Center(
        child: _buildAvailableFeaturesList(),
      ),
    );
  }

  Widget _buildAvailableFeaturesList() {
    List<Feature> availableFeatures = [
      UserLogin(),
      UserProfile(),
      UserContent()
    ];
    return ListView.builder(
      itemCount: availableFeatures.length,
      itemBuilder: (BuildContext context, int index) {
        // ignore: unnecessary_new
        return new GestureDetector(
          onTap: () {},
          child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 600,
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        color: Colors.white70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          availableFeatures[index].name,
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 20),
                          maxLines: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            StatelessWidget screen;
                            if (index == 0) {
                              screen = FeatureScreen(feature: UserLogin());
                            } else if (index == 1) {
                              screen = FeatureScreen(feature: UserProfile());
                            } else {
                              screen = const UserContentScreen();
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => screen),
                            );
                            project.addFeature(availableFeatures[index]);
                          },
                          child: Container(
                              margin: const EdgeInsets.all(0.0),
                              child: const Icon(
                                Icons.add_circle_rounded,
                                color: Colors.teal,
                                size: 30.0,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 0.0),
                    child: Container(
                      height: 10.0,
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
