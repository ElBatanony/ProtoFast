import 'package:flutter/material.dart';
import 'package:protofast/configurations/bool_configuration.dart';
import 'package:protofast/configurations/string_configuration.dart';
import 'package:protofast/models/feature.dart';

import 'package:protofast/presentation/my_flutter_app_icons.dart';

class UserLogin extends Feature {
  UserLogin()
      : super('User Login', MyFlutterApp.login, [
          BoolConfiguration('Can users login with their phone numbers?', false),
          StringConfiguration(
              'What should the login button display?', 'Log In'),
        ]);
}
