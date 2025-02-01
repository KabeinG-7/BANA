import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:nepali_utils/nepali_utils.dart'; // For Nepali date conversion
import 'package:banap/base_scaffold.dart';

class NepaliCalendar extends StatefulWidget {
  const NepaliCalendar({super.key});

  @override
  State<NepaliCalendar> createState() => _NepaliCalendarState();
}

class _NepaliCalendarState extends State<NepaliCalendar> {
  DateTime _selectedDate = DateTime.now();
  NepaliDateTime _nepaliDate = NepaliDateTime.now();
  bool _isDarkMode = false;

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
      body: Container(
        decoration: BoxDecoration(
          gradient: _isDarkMode
              ? const LinearGradient(
                  colors: [Colors.black87, Colors.black54],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 10, 97, 144),
                    Color.fromARGB(255, 0, 157, 255)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Toggle Dark/Light Mode
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Dark Mode',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: _isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        _isDarkMode = value;
                      });
                    },
                  ),
                ],
              ),

              // Display Nepali Date with Border
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(10),
                  color: _isDarkMode ? Colors.grey[900] : Colors.white,
                ),
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.blue),
                    Text(
                      _nepaliDate.format("yyyy MMMM dd, EEE"),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: _isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Display English Date with Border
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(10),
                  color: _isDarkMode ? Colors.grey[900] : Colors.white,
                ),
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Icon(Icons.date_range, color: Colors.green),
                    Text(
                      DateFormat('yyyy MMMM dd, EEEE').format(_selectedDate),
                      style: TextStyle(
                        fontSize: 18,
                        color: _isDarkMode ? Colors.white70 : Colors.black,
                      ),
                    ),
                  ],
                ),
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

              // Nepali Events List
              const Text(
                'Nepali Events:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              Expanded(
                child: ListView(
                  children: _getNepaliEvents(_nepaliDate.month),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getNepaliEvents(int month) {
    final events = {
      1: ["Maghe Sankranti 🎉"],
      4: ["Ram Navami 🎉"],
      9: ["Dashain 🎉"],
      10: ["Maghe Sankranti 🎉"],
      // Add more events for other months
    };

    if (events.containsKey(month)) {
      return events[month]!
          .map((event) => ListTile(
                leading: const Icon(Icons.event, color: Colors.deepOrange),
                title: Text(
                  event,
                  style: TextStyle(
                    color: _isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ))
          .toList();
    } else {
      return [
        ListTile(
          leading: const Icon(Icons.info, color: Colors.grey),
          title: Text(
            "No events this month.",
            style: TextStyle(
              color: _isDarkMode ? Colors.white70 : Colors.black54,
            ),
          ),
        ),
      ];
    }
  }
}
