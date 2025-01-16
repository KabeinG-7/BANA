import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const BaseScaffold({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              // Implement notification logic (e.g., show a dialog or navigate to a notifications page)
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Notifications"),
                  content: Text("No new notifications."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("OK"),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue, // Customize as needed
              ),
              child: Text(
                'BANA Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_view_day),
              title: const Text('Events'),
              onTap: () {
                Navigator.pushNamed(context, '/events');
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Members'),
              onTap: () {
                Navigator.pushNamed(context, '/Members');
              },
            ),
            ListTile(
              leading: const Icon(Icons.present_to_all),
              title: const Text('Publications'),
              onTap: () {
                Navigator.pushNamed(context, '/publication');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month_outlined),
              title: const Text('Nepali Calendar'),
              onTap: () {
                Navigator.pushNamed(context, '/nepalicalendar');
              },
            ),
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text('Money Exchange Rate'),
              onTap: () {
                Navigator.pushNamed(context, '/moneyexchangerate');
              },
            ),
            ListTile(
              leading: const Icon(Icons.volunteer_activism),
              title: const Text('Volunteer Opportunity'),
              onTap: () {
                Navigator.pushNamed(context, '/volunteeropportunity');
              },
            ),
            // ... Add other menu items similarly
          ],
        ),
      ),
      body: body,
    );
  }
}
