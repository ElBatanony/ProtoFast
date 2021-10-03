import 'package:protofast/configurations/bool_configuration.dart';
import 'package:protofast/configurations/string_configuration.dart';
import 'package:protofast/models/feature.dart';

import 'package:protofast/presentation/my_flutter_app_icons.dart';

class Videos extends Feature {
  Videos()
      : super('Videos', MyFlutterApp.login, [
          BoolConfiguration('Will users be able to upload videos?', false),
          BoolConfiguration('Will users be able to save videos?', false),
          BoolConfiguration(
              'Will users be able to edit video settings?', false),
          StringConfiguration(
              'What settings you have for videos ?', 'video quality')
        ]);
}
