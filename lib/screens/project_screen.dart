import 'package:flutter/material.dart';
import 'package:protofast/models/feature.dart';
import 'package:protofast/models/project.dart';
import 'package:protofast/screens/available_features.dart';
import 'package:protofast/screens/srs_screen.dart';

class ProjectScreen extends StatefulWidget {
  final Project project;

  const ProjectScreen({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  void goToSRS() {
    setState(() {});
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SrsScreen(project: widget.project)),
    );
  }

  void goToFeaturesList() {
    setState(() {});

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              AvailableFeaturesScreen(project: widget.project)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.project.name),
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
                _projectInfoWidget(widget.project),
                featuresList(widget.project.features),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: goToFeaturesList,
                    child: const Text('See list of available features')),
                Container(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: goToSRS, child: const Text('Generate SRS')),
              ],
            ),
          ),
        ));
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

Widget featuresList(List<Feature> features) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: features.map((feature) => feature.featureWidget()).toList());
}
