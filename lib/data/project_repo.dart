import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/project.dart';
class ProjectRepository {
  // 1
  final CollectionReference projectCollection =
  FirebaseFirestore.instance.collection('projects');
  // 2
  Stream<QuerySnapshot> getStream() {
    return projectCollection.snapshots();
  }
  // 3
  Future<DocumentReference> addProject(Project project) {
    return projectCollection.add(project.toJson());
  }
  // 4
  void updatePet(Project project) async {
    await projectCollection.doc(project.name).update(project.toJson());
  }
  // 5
  void deletePet(Project project) async {
    await projectCollection.doc(project.name).delete();
  }
}