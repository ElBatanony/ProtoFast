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
}
