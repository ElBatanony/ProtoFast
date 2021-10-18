import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:protofast/models/feature.dart';

enum Platforms { android, iOS, web, windwos, macOS, linux }

class Project {
  String name;
  List<Feature> features;
  List<Platforms> platforms;

  Project(this.name, this.features, this.platforms);

  Widget generateSRS() {
    return Column(children: [
      ...features.map((feature) => feature.generateSpecification()).toList()
    ]);
  }

  void addFeature(Feature feature) {
    features.add(feature);
  }

  Project.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        features = [],
        platforms = [];

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  factory Project.fromSnapshot(DocumentSnapshot snapshot) {
    final newProject = Project.fromJson(snapshot.data() as Map<String, dynamic>);
    newProject.name = snapshot.reference.id;
    return newProject;
  }

  // TODO: save and load project and features (use Shared Prefrences)
}
