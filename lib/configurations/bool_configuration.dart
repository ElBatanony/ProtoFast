import 'package:flutter/material.dart';
import 'package:protofast/models/configuration.dart';

class BoolConfiguration extends Configuration<bool> {
  bool isEnabled = false;

  BoolConfiguration(String question, this.isEnabled) : super(question);

  @override
  String generateSpecifications() {
    return question + ': ' + isEnabled.toString();
  }

  @override
  Widget configurationWidget() {
    return BoolConfigurationWidget(boolConfig: this);
  }

  @override
  void setConfiguration(bool newConfig) {
    isEnabled = newConfig;
  }
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
