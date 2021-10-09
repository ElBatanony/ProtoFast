import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protofast/features/user_login.dart';
import 'package:protofast/features/user_profile.dart';
import 'package:protofast/models/configuration.dart';

abstract class Feature {
  String name;
  List<Configuration> configs;
  int? estimation;
  int? priority;
  IconData? icon;

  Feature(this.name, this.icon, this.configs, {this.estimation, this.priority});

  Widget generateSpecification() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        featureNameWidget(),
        ...configs
            .map((config) => Text(
          config.generateSpecifications(),
          textAlign: TextAlign.center,
        ))
            .toList()
      ]),
    );
  }

  Widget featureWidget() {
    return Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [featureNameWidget()]),
      ...configs.map((config) => config.configurationWidget()).toList(),
      const SizedBox(height: 3)
    ]);
  }

  Widget featureNameWidget() {
    return Text(name, style: const TextStyle(fontSize: 24));
  }

  Widget featureIconWidget() {
    return Icon(
      icon,
    );
  }

  Map<String, dynamic> toJson() => {
    'name' : name
  };

  static List<Feature> fromJson(Map<String, dynamic> projectJson) {
    for (var entry in projectJson.entries) {
      if (entry.key == "features") {
        var values = List<LinkedHashMap<String, dynamic>>.from(entry.value);
        return castStringToFeatures(values);
      }
    }
    return [];
  }

  static List<Feature> castStringToFeatures(
      List<LinkedHashMap<String, dynamic>> features) {
    List<Feature> featureList = [];
    for (LinkedHashMap<String, dynamic> feature in features) {
      if (feature['name'] == "User Login") {
        featureList.add(UserLogin());
      }
      if (feature['name'] == "User Profile") {
        featureList.add(UserProfile());
      }
    }
    return featureList;
  }
}
