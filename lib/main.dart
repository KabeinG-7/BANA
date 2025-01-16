import 'package:banap/pages/events.dart';
import 'package:banap/pages/members.dart';
import 'package:banap/pages/money_exchange_rate.dart';
import 'package:banap/pages/nepali_calendar.dart';
import 'package:banap/pages/publications.dart';
import 'package:banap/pages/volunteer_opportunity.dart';
import 'package:flutter/material.dart';
import 'package:banap/pages/home_page.dart';
import 'package:banap/pages/about_page.dart';
import 'package:banap/pages/events.dart'; // Create this file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BANA App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home', // Start with the home page
      routes: {
        '/home': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/events': (context) => const Events(),
        '/Members': (context) => const Members(),
        '/publication': (context) => const Publications(),
        '/nepalicalendar': (context) => const NepaliCalendar(),
        '/moneyexchangerate': (context) => const MoneyExchangeRate(),
        '/volunteeropportunity': (context) => const VolunteerOpportunity(),
        // Add other routes
      },
    );
  }
}
