import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:protofast/data/project_repo.dart';
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
  final ProjectRepository projectRepository = ProjectRepository();
  CollectionReference projectsCollection = FirebaseFirestore.instance.collection('projects');
  List<QuerySnapshot> datas = [];

  Future<void> loadProjects() async {
    projects = await ProjectsManager.loadProjects();
    Project sampleProject = Project('WeTube', [UserLogin(), UserProfile()],
        [Platforms.android, Platforms.web]);
    projects.add(sampleProject);

    setState(() {});
  }




  @override
  void initState() {
    loadProjects();
    super.initState();
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


// 1
    Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
      return ListView(
        padding: const EdgeInsets.only(top: 20.0),
        // 2
        children:  snapshot.map((data) => _buildListItem(context, data)).toList(),
      );
    }
// 3
    Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
      // 4
      final project = Project.fromSnapshot(snapshot);

       return ListTile(
        title: Text('jjj'),
        subtitle: Text(''),
      );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Projects'),
      ),
      body:
          Column(
            children: [

      Flexible(
        child:
      StreamBuilder(
          stream: projectsCollection.snapshots(),
          builder: (context,snapshot){
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return

              ListView.builder(
              itemCount:(snapshot.data! as QuerySnapshot).docs.length,
              itemBuilder: (context,index){
                return
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Project project = Project((snapshot.data! as QuerySnapshot).docs[index]['name'], [], []);
                          _goToProject(project);
                        },
                        child:    ListTile(
                          title: Text((snapshot.data! as QuerySnapshot).docs[index]['name']),
                        )),

                    );



              },

            );
          })),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _goToCreateProject,
                    child: const Text('Create a Project'),
                  )),
            ]),

    );
  }
  /*Widget build(BuildContext context) {
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
  }*/


}
