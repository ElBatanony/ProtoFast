import 'package:protofast/configurations/bool_configuration.dart';
import 'package:protofast/configurations/string_configuration.dart';
import 'package:protofast/models/feature.dart';

class UserProfile extends Feature {
  UserProfile()
      : super('User Profile', [
          BoolConfiguration('Can users update their emails?', false),
          BoolConfiguration('Can users update their phone number?', false),
          BoolConfiguration('Can users update their profile image?', false),
          StringConfiguration(
              'What should information should the user profile contain?',
              'Ex: Username'),
        ]);
}
