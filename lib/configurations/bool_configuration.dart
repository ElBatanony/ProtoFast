import 'package:protofast/models/configuration.dart';

class BoolConfiguration extends Configuration {
  bool isEnabled = false;

  BoolConfiguration(String question, this.isEnabled) : super(question);

  @override
  String generateSpecifications() {
    return question + ': ' + isEnabled.toString();
  }
}
