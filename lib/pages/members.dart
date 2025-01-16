import 'package:flutter/material.dart';
import 'package:banap/base_scaffold.dart';

class Members extends StatelessWidget {
  const Members({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'Members',
      body: Center(
        child: Text('Members Content'),
      ),
    );
  }
}
