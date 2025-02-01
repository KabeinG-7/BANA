import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:banap/base_scaffold.dart';

class Members extends StatelessWidget {
  const Members({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Members',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // "Become a Member" Button
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BecomeMemberPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow[100], // Pale Yellow
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Become a Member',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),

          // "General Members" Button
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GeneralMembersPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[800], // Dark Blue
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'General Members',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),

          // "Life Members" Button
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LifeMembersPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow[100], // Pale Yellow
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Life Members',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder Page for "Become a Member"
class BecomeMemberPage extends StatelessWidget {
  const BecomeMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Become a Member')),
      body: const Center(child: Text('Become a Member Page')),
    );
  }
}

// General Members Page with WebView
class GeneralMembersPage extends StatefulWidget {
  const GeneralMembersPage({super.key});

  @override
  State<GeneralMembersPage> createState() => _GeneralMembersPageState();
}

class _GeneralMembersPageState extends State<GeneralMembersPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://banaonline.org/members/general/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('General Members')),
      body: WebViewWidget(controller: _controller),
    );
  }
}

// Placeholder Page for "Life Members"
class LifeMembersPage extends StatelessWidget {
  const LifeMembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Life Members')),
      body: const Center(child: Text('Life Members Page')),
    );
  }
}
