import 'package:flutter/material.dart';
import 'package:protofast/data/project_repo.dart';
import 'package:protofast/data/projects_manager.dart';
import 'package:protofast/models/project.dart';
import 'package:protofast/screens/project_screen.dart';


class NewProjectScreen extends StatefulWidget {
  const NewProjectScreen({Key? key}) : super(key: key);

  @override
  _NewProjectScreenState createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<NewProjectScreen> {
  TextEditingController projectNameController = TextEditingController();

  void _createProject() async {
    Project newProject = Project(projectNameController.text, [], []);
    ProjectRepository projectRepository = ProjectRepository();
    projectRepository.addProject(newProject);
    await ProjectsManager.addProject(newProject);
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProjectScreen(project: newProject)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Create a new project')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: projectNameController,
                    decoration:
                        const InputDecoration(label: Text('Project Name'))),
              ),
              ElevatedButton(
                  onPressed: _createProject,
                  child: const Text('Create Project'))
            ],
          ),
        ));
  }
}
