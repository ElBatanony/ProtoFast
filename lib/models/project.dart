import 'package:flutter/material.dart';
import 'package:protofast/models/feature.dart';

enum Platforms { android, iOS, web, windows, macOS, linux }

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

  Project.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        features = Feature.fromJson(json),
        platforms = platformFromJson(json);

  static List<Platforms> platformFromJson(Map<String, dynamic> json) {
    List<Platforms> platforms = [];
    var platformNames;
    if (json['platforms'] == null) return [];
    else {
      platformNames = List<String>.from(json['platforms']);
    }
    for (String platform in platformNames) {
      platforms.add(Platforms.values.singleWhere((value) => value.toString() == platform));
    }
    return platforms;
  }

  Map<String, dynamic> toJson() =>
      {'name': name,
        'features': [features.map((feature) => feature.toJson())],
        'platforms': [platforms.map((platform) => {'platform': platform.toString()})]
      };
}
