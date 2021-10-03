import 'package:flutter/material.dart';
import 'package:protofast/features/user_login.dart';
import 'package:protofast/features/user_profile.dart';
import 'package:protofast/models/feature.dart';
import 'package:protofast/models/project.dart';
import 'package:protofast/screens/srs_screen.dart';
import 'package:protofast/screens/available_features.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Project myProject = Project('WeTube', [UserLogin(), UserProfile()],
      [Platforms.android, Platforms.web]);

  void goToSRS() {
    setState(() {});
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SrsScreen(project: myProject)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ProtoFast v0.1.0'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Your Features',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
                featuresList(myProject.features),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: goToSRS,
                    child: const Text('Go to Available features')),
              ],
            ),
          ),
        ));
  }
}

// ignore: unused_element
Widget _projectInfoWidget(Project project) {
  return Column(
    children: [
      Text('Project name: ' + project.name),
      const Text('Platforms: '),
      ...project.platforms.map((platform) => Text(platform.toString())).toList()
    ],
  );
}

Widget featuresList(List<Feature> features) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: features.map((feature) => feature.featureWidget()).toList());
}
