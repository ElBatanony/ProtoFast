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
      SizedBox(height: 20.0),
      Column(children: [
        ...features
            .map(
              (feature) => Container(
                  height: 100,
                  width: 600,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(child: feature.generateSpecification())),
            )
            .toList(),
        SizedBox(height: 40),
      ])
    ]);
  }

  // TODO: save and load project and features (use Shared Prefrences)
}
