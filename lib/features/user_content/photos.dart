import 'package:protofast/configurations/bool_configuration.dart';
import 'package:protofast/configurations/string_configuration.dart';
import 'package:protofast/models/feature.dart';

import 'package:protofast/presentation/my_flutter_app_icons.dart';

class Photos extends Feature {
  Photos()
      : super('Photos', MyFlutterApp.login, [
          BoolConfiguration(
              'Will users be able to add filters to their photos?', false),
          BoolConfiguration(
              'Will users be able to add captions to their photos?', false),
          BoolConfiguration('Will users be able to upload photos?', false),
          BoolConfiguration('Will users be able to save photos?', false),
        ]);
}
