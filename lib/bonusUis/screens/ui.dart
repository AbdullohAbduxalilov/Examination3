import 'package:flutter/material.dart';

class UiPage extends StatefulWidget {
  const UiPage({Key? key}) : super(key: key);

  @override
  _UiPageState createState() => _UiPageState();
}

class _UiPageState extends State<UiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ui from dribble"),
      ),
    );
  }
}
