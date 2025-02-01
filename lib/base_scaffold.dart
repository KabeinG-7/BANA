import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final AssetImage? image;

  const BaseScaffold({
    super.key,
    required this.title,
    required this.body,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8DC), // Pale yellow color
        title: Column(
          mainAxisSize: MainAxisSize.min, // Minimize column height
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Rounded border
                      border: Border.all(
                          color: const Color.fromARGB(255, 33, 37, 243),
                          width: 2.0), // Border color and width
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/logo.png'), // Replace with your image path
                        fit: BoxFit
                            .cover, // Ensure the image covers the container
                      ),
                    ),
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Text(
              "Baltimore Association of Nepalese in America",
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 125, 132, 124)),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Notifications"),
                  content: const Text("No new notifications."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.notifications),
          ),
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 8, 71, 171),
              ),
              child: Text(
                'Baltimore Association of Nepalese in America(BANA)',
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
            ListTile(
              leading: const Icon(Icons.contact_mail_rounded),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pushNamed(context, '/contactus');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: body), // The main body of the page
          SafeArea(
            child: Container(
              color: Colors.grey[200], // Background color for the icons section
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/events'); // Navigate to events
                    },
                    child: const Icon(Icons.event,
                        size: 30, color: Color.fromARGB(255, 55, 53, 53)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home'); // Navigate to home
                    },
                    child: const Icon(Icons.home,
                        size: 30, color: Color.fromARGB(255, 94, 87, 87)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/share'); // Navigate to share
                    },
                    child: const Icon(Icons.share,
                        size: 30, color: Color.fromARGB(255, 96, 90, 90)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
