import 'package:protofast/configurations/bool_configuration.dart';
import 'package:protofast/models/feature.dart';
import 'package:protofast/presentation/my_flutter_app_icons.dart';

class UserProfile extends Feature {
  UserProfile()
      : super('User Profile', MyFlutterApp.login, [
          BoolConfiguration('Can users update their emails?', false),
          BoolConfiguration('Can users update their phone number?', false),
          BoolConfiguration('Can users update their profile image?', false),
        ]);
}
