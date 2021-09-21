import 'package:flutter/material.dart';

abstract class Configuration<T> {
  T value;
  String question;
  String? description;
  int? estimation;

  Configuration(this.question, this.value, {this.description, this.estimation});

  String generateSpecifications() {
    return question + ' - ' + value.toString();
  }

  Widget configurationWidget();

  void setConfiguration(T newConfig) {
    value = newConfig;
  }
}
