import 'package:protofast/configurations/bool_configuration.dart';
import 'package:protofast/configurations/string_configuration.dart';
import 'package:protofast/models/feature.dart';

import 'package:protofast/presentation/my_flutter_app_icons.dart';

class UserContent extends Feature {
  UserContent()
      : super('User Content', MyFlutterApp.login, [
          BoolConfiguration('Can users login with their phone numbers?', false),
          StringConfiguration(
              'What should the login button display?', 'Log In'),
          StringConfiguration('What is your slogan (catch phrase) to display?',
              'Prototype Fast Now')
        ]);
}
