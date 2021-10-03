import 'dart:convert';

import 'package:protofast/models/project.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectsManager {
  static Future<List<Project>> loadProjects() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> projectsJson = prefs.getStringList('projects') ?? [];
    return projectsJson.map((e) => Project.fromJson(jsonDecode(e))).toList();
  }

  static Future<void> saveProjects(List<Project> projects) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('projects',
        projects.map((project) => jsonEncode(project.toJson())).toList());
  }

  static Future<void> addProject(Project project) async {
    List<Project> projects = await loadProjects();
    projects.add(project);
    saveProjects(projects);
  }
}
