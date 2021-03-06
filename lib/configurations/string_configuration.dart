import 'package:flutter/material.dart';
import 'package:protofast/models/configuration.dart';

class StringConfiguration extends Configuration<String> {
  StringConfiguration(String question, String value) : super(question, value);

  @override
  Widget configurationWidget() {
    return StringConfigurationWidget(stringConfig: this);
  }
}

class StringConfigurationWidget extends StatefulWidget {
  const StringConfigurationWidget({Key? key, required this.stringConfig})
      : super(key: key);

  final StringConfiguration stringConfig;

  @override
  _StringConfigurationWidgetState createState() =>
      _StringConfigurationWidgetState();
}

class _StringConfigurationWidgetState extends State<StringConfigurationWidget> {
  TextEditingController controller = TextEditingController(text: '');

  @override
  void initState() {
    setState(() {
      controller.text = widget.stringConfig.value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(children: [
        Text(widget.stringConfig.question),
        const SizedBox(height: 8),
        TextField(
          textAlign: TextAlign.center,
          controller: controller,
          decoration: const InputDecoration(border: OutlineInputBorder()),
          onChanged: (value) {
            setState(() {
              widget.stringConfig.setConfiguration(value);
            });
          },
        )
      ]),
    );
  }
}
