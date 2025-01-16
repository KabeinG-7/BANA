import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:nepali_utils/nepali_utils.dart'; // For Nepali date conversion
import 'package:banap/base_scaffold.dart';

class NepaliCalendar extends StatefulWidget {
  const NepaliCalendar({Key? key}) : super(key: key);

  @override
  State<NepaliCalendar> createState() => _NepaliCalendarState();
}

class _NepaliCalendarState extends State<NepaliCalendar> {
  DateTime _selectedDate = DateTime.now();
  NepaliDateTime _nepaliDate = NepaliDateTime.now();

  void _selectDate(DateTime? picked) {
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _nepaliDate = picked.toNepaliDateTime();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Nepali Calendar',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Display Nepali Date
            Text(
              _nepaliDate.format("yyyy MMMM dd, EEEE"), // Format Nepali date
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Display English Date
            Text(
              DateFormat('yyyy MMMM dd, EEEE').format(_selectedDate),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Calendar Picker
            CalendarDatePicker(
              initialDate: _selectedDate,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              onDateChanged: _selectDate,
            ),
            const SizedBox(height: 20),
            // Nepali Events List (Example)
            const Text(
              'Nepali Events:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: _getNepaliEvents(
                    _nepaliDate.month), // Function to get events
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getNepaliEvents(int month) {
    // Replace this with your actual event data source.
    // This is just sample data.
    final events = {
      1: ["Maghe Sankranti"],
      4: ["Ram Navami"],
      9: ["Dashain"],
      10: ["Tihar"],
      // ... Add more events for other months
    };

    if (events.containsKey(month)) {
      return events[month]!
          .map((event) => ListTile(title: Text(event)))
          .toList();
    } else {
      return [const ListTile(title: Text("No events this month."))];
    }
  }
}
