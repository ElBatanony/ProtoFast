import 'package:flutter/material.dart';
import 'package:protofast/models/configuration.dart';

class BoolConfiguration extends Configuration<bool> {
  BoolConfiguration(String question, bool value) : super(question, value);

  @override
  Widget configurationWidget() {
    return BoolConfigurationWidget(boolConfig: this);
  }

  @override
  void setConfiguration(bool newConfig) {
    isEnabled = newConfig;
  }
  bool isEnabled() => value;
}

class BoolConfigurationWidget extends StatefulWidget {
  const BoolConfigurationWidget({Key? key, required this.boolConfig})
      : super(key: key);

  final BoolConfiguration boolConfig;

  @override
  _BoolConfigurationWidgetState createState() =>
      _BoolConfigurationWidgetState();
}

class _BoolConfigurationWidgetState extends State<BoolConfigurationWidget> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(widget.boolConfig.question),
      Switch(
          value: widget.boolConfig.isEnabled(),
          onChanged: (value) {
            setState(() {
              widget.boolConfig.setConfiguration(value);
            });
          })
    ]);
  }
}
