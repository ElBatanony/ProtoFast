import 'package:flutter/material.dart';
import 'package:protofast/models/configuration.dart';

class StringConfiguration extends Configuration<String> {
  StringConfiguration(String question, String value) : super(question, value);

  @override
  Widget configurationWidget() {
    return StringConfigurationWidget(boolConfig: this);
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
  TextEditingController controller = TextEditingController(text: '');

  @override
  void initState() {
    setState(() {
      controller.text = widget.boolConfig.value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: widget.boolConfig.question,
        ),
        onChanged: (value) {
          setState(() {
            widget.boolConfig.setConfiguration(value);
          });
        },
      )
    ]);
  }
}
