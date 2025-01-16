import 'package:flutter/material.dart';
import 'package:banap/base_scaffold.dart';

class VolunteerOpportunity extends StatelessWidget {
  const VolunteerOpportunity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'Volunteer Opportunity',
      body: Center(
        child: Text('Volunteer Opportunity'),
      ),
    );
  }
}
