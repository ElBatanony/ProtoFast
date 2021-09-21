import 'package:flutter/material.dart';
import 'package:protofast/models/configuration.dart';

class StringConfiguration extends Configuration {
  String value;

  StringConfiguration(String question, this.value) : super(question);

  @override
  String generateSpecifications() {
    return question + ': ' + value;
  }

  @override
  Widget configurationWidget() {
    return StringConfigurationWidget(boolConfig: this);
  }

  void setConfiguration(String newConfig) {
    value = newConfig;
  }
}

class StringConfigurationWidget extends StatefulWidget {
  const StringConfigurationWidget({Key? key, required this.boolConfig})
      : super(key: key);

  final StringConfiguration boolConfig;

  @override
  _StringConfigurationWidgetState createState() =>
      _StringConfigurationWidgetState();
}

class _StringConfigurationWidgetState extends State<StringConfigurationWidget> {
  String value = "";
  TextEditingController controller = TextEditingController(text: '');

  @override
  void initState() {
    setState(() {
      value = widget.boolConfig.value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        decoration: InputDecoration(
          labelText: widget.boolConfig.question,
        ),
        controller: controller,
        onChanged: (value) {
          setState(() {
            value = value;
            widget.boolConfig.setConfiguration(value);
          });
        },
      )
    ]);
  }
}
