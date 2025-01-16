import 'package:flutter/material.dart';
import 'package:banap/base_scaffold.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'Event',
      body: Center(
        child: Text('Events Content'),
      ),
    );
  }
}
