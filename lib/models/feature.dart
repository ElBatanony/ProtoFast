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
      featureNameWidget(),
      ...configs.map((config) => Text(config.generateSpecifications())).toList()
    ]);
  }

  Widget featureWidget() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      featureNameWidget(),
      ...configs.map((config) => config.configurationWidget()).toList()
    ]);
  }

  Widget featureNameWidget() {
    return Text(name, style: const TextStyle(fontSize: 24));
  }
}
