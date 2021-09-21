import 'package:flutter/material.dart';

abstract class Configuration<T> {
  String question;
  String? description;
  int? estimation;

  Configuration(this.question, {this.description, this.estimation});

  String generateSpecifications();

  Widget configurationWidget();

  void setConfiguration(T newConfig);
}
