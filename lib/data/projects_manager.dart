import 'dart:convert';

import 'package:protofast/models/project.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectsManager {
  static Future<List<Project>> loadProjects() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> projectsJson = prefs.getStringList('projects') ?? [];
    return projectsJson.map((e) => Project.fromJson(jsonDecode(e))).toList();
  }

  static Future<bool> saveProjects(List<Project> projects) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList('projects',
        projects.map((project) => jsonEncode(project.toJson())).toList());
  }

  static Future<bool> addProject(Project project) async {
    List<Project> projects = await loadProjects();
    if (!projects.contains(project)) {
      projects.add(project);
    }
    return saveProjects(projects);
  }

  static Future<bool> deleteProject(Project projectToDelete) async {
    List<Project> projects = await loadProjects();
    projects.remove(
        projects.firstWhere((project) => project.name == projectToDelete.name));

    return saveProjects(projects);
  }
}
