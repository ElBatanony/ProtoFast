import 'package:flutter/material.dart';

class NewProjectScreen extends StatefulWidget {
  const NewProjectScreen({Key? key}) : super(key: key);

  @override
  _NewProjectScreenState createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<NewProjectScreen> {
  TextEditingController projectNameController = TextEditingController();

  void _createProject() {
    print(projectNameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Create a new project')),
        body: Column(
          children: [
            TextField(
                controller: projectNameController,
                decoration: const InputDecoration(label: Text('Project Name'))),
            ElevatedButton(
                onPressed: _createProject, child: const Text('Create Project'))
          ],
        ));
  }
}
