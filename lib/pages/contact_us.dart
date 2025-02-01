import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Contactus extends StatelessWidget {
  const Contactus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contact Information
            const Text(
              'Contact Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: const [
                Icon(Icons.email, color: Colors.blue),
                SizedBox(width: 10),
                Text('info@banaonline.org', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.phone, color: Colors.green),
                SizedBox(width: 10),
                Text('+1 (123) 456-7890', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '2906 Taylor Ave, Baltimore, MD',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Map Placeholder
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: const Center(
                child: Text(
                  'Map Placeholder (2906 Taylor Ave)',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Contact Form
            const Text(
              'Contact Form',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const ContactForm(),
          ],
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        "origin": 'http://localhost',
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "service_id": "service_jw47t2h", // Replace with your EmailJS service ID
        "template_id":
            "template_w0m7hyg", // Replace with your EmailJS template ID
        "user_id": "9jAB_IURyABYCXqdQ", // Replace with your EmailJS user ID
        "template_params": {
          "name": name,
          "email": email,
          "subject": subject,
          "message": message,
        },
      }),
    );

    if (response.statusCode == 200) {
      print('Email sent successfully!');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent successfully!')),
      );
    } else {
      print('Failed to send email: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send message.')),
      );
    }
  }

  void _sendMessage() {
    if (_formKey.currentState!.validate()) {
      final String name = _nameController.text;
      final String email = _emailController.text;
      final String message = _messageController.text;

      sendEmail(
        name: name,
        email: email,
        subject: "New Contact Form Submission",
        message: message,
      );

      // Clear the form fields
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Name Field
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),

          // Email Field
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),

          // Message Field
          TextFormField(
            controller: _messageController,
            decoration: const InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const SizedBox(height: 20.0),

          // Send Button
          ElevatedButton.icon(
            onPressed: _sendMessage,
            icon: const Icon(Icons.send),
            label: const Text('Send Message'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: Contactus()));
}
