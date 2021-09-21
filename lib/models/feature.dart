import 'package:flutter/cupertino.dart';
import 'package:protofast/models/configuration.dart';

abstract class Feature {
  String name;
  List<Configuration> configs;
  int? estimation;
  int? priority;

  Feature(this.name, this.configs, {this.estimation, this.priority});

  Widget generateSpecification() {
    return Column(children: [
      Text(name),
      ...configs.map((config) => Text(config.generateSpecifications())).toList()
    ]);
  }
}
