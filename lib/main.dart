import 'package:flutter/material.dart';
import 'package:protofast/features/user_login.dart';
import 'package:protofast/models/project.dart';

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
        primarySwatch: Colors.blue,
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
  Project myProject =
      Project('WeTube', [UserLogin()], [Platforms.android, Platforms.web]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProtoFast'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Your Project'),
          _projectInfoWidget(myProject),
          const Text('Your Features'),
          ...myProject.features
              .map((feature) => feature.featureWidget())
              .toList()
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget _projectInfoWidget(Project project) {
  return Column(
    children: [
      Text('Project name: ' + project.name),
      const Text('Platforms: '),
      ...project.platforms.map((platform) => Text(platform.toString())).toList()
    ],
  );
}
