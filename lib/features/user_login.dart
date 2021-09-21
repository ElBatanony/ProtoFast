import 'package:protofast/configurations/bool_configuration.dart';
import 'package:protofast/models/feature.dart';

class UserLogin extends Feature {
  UserLogin()
      : super('User Login', [
          BoolConfiguration('Can users login with their phone numbers?', false)
        ]);
}