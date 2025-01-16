import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:banap/base_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _content = "";
  bool _isLoading = true;
  String _errorMessage = "";

  @override
  void initState() {
    super.initState();
    _fetchContent();
  }

  Future<void> _fetchContent() async {
    try {
      final response = await http.get(Uri.parse('https://banaonline.org/'));
      if (response.statusCode == 200) {
        final document = parser.parse(response.body);

        // Example: Extracting all paragraph text
        final paragraphs = document.querySelectorAll('p');
        _content = paragraphs.map((p) => p.text).join('\n\n');

        // More robust parsing needed based on the actual HTML structure.
        // You might want to target specific divs or classes.

        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage =
              "Failed to load content. Status code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = "An error occurred: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'BANA',
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : SingleChildScrollView(
                  // Important for scrollable content
                  padding: const EdgeInsets.all(16.0),
                  child: Text(_content),
                ),
    );
  }
}
