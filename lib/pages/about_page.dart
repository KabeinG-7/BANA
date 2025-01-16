import 'package:flutter/material.dart';
import 'package:banap/base_scaffold.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'About Us',
      body: Center(
        child: Text('About Us Content'),
      ),
    );
  }
}
