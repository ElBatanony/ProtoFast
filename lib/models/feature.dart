import 'package:flutter/cupertino.dart';
import 'package:protofast/models/configuration.dart';

abstract class Feature {
  String name;
  List<Configuration> configs;
  int? estimation;
  int? priority;
  IconData icon;

  Feature(this.name, this.icon, this.configs, {this.estimation, this.priority});

  Widget generateSpecification() {
    return Column(children: [
      featureNameWidget(),
      ...configs.map((config) => Text(config.generateSpecifications())).toList()
    ]);
  }

  Widget featureWidget() {
    return Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [featureNameWidget(), featureIconWidget()]),
      ...configs.map((config) => config.configurationWidget()).toList(),
      SizedBox(height: 40),
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
}
