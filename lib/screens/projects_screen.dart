import 'package:flutter/material.dart';
import 'package:protofast/data/projects_manager.dart';
import 'package:protofast/models/project.dart';
import 'package:protofast/screens/new_project_screen.dart';
import 'package:protofast/screens/project_screen.dart';

import 'package:protofast/features/user_login.dart';
import 'package:protofast/features/user_profile.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  List<Project> projects = [];

  Future<void> loadProjects() async {
    projects = await ProjectsManager.loadProjects();
    setState(() {});
  }

  void addSampleProjectWithDefaultConfigurations() {
    Project sampleProject = Project('WeTube', [UserLogin(), UserProfile()],
        [Platforms.android, Platforms.web]);
    ProjectsManager.addProject(sampleProject);
  }

  @override
  void initState() {
    super.initState();
    addSampleProjectWithDefaultConfigurations();
    loadProjects();
  }

  void _goToProject(Project project) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProjectScreen(project: project)),
    );
  }

  void _goToCreateProject() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewProjectScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    loadProjects();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Projects'),
      ),
      body: Center(
        child: Column(
          children: [
            ...projects
                .map(
                  (project) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () => _goToProject(project),
                        child: Text(project.name)),
                  ),
                )
                .toList(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _goToCreateProject,
                child: const Text('Create a Project'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
