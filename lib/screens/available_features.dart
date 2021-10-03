import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protofast/models/project.dart';

class AvailableFeaturesScreen extends StatelessWidget {
  final Project project;
  const AvailableFeaturesScreen({Key? key, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Features"),
      ),
      body: Center(
        child: _buildAvailableFeaturesList(),
      ),
    );
  }

  Widget _buildAvailableFeaturesList() {
    return ListView.builder(
      itemCount: project.features.length,
      itemBuilder: (BuildContext context, int index) {
        // ignore: unnecessary_new
        return new GestureDetector(
          onTap: () {},
          child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 600,
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        color: Colors.white70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          project.features[index].name,
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 20),
                          maxLines: 1,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              margin: const EdgeInsets.all(0.0),
                              child: const Icon(
                                Icons.add_circle_rounded,
                                color: Colors.teal,
                                size: 30.0,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 0.0),
                    child: Container(
                      height: 10.0,
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
