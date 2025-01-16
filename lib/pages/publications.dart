import 'package:flutter/material.dart';
import 'package:banap/base_scaffold.dart';

class Publications extends StatelessWidget {
  const Publications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'Publications',
      body: Center(
        child: Text('Publications Content'),
      ),
    );
  }
}
