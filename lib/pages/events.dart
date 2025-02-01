import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CueCard(
              title: "Music Festival",
              date: "28th January 2025",
              location: "Central Park, New York",
              description:
                  "Join us for an unforgettable evening of live music featuring top artists and bands from around the world.",
              imageUrl:
                  "https://via.placeholder.com/150", // Replace with your image URL
            ),
            SizedBox(height: 16),
            CueCard(
              title: "Art Exhibition",
              date: "5th February 2025",
              location: "Modern Art Gallery, Chicago",
              description:
                  "Explore the latest works of modern art from renowned artists. A perfect event for art enthusiasts.",
              imageUrl: "https://via.placeholder.com/150",
            ),
          ],
        ),
      ),
    );
  }
}

class CueCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String description;
  final String imageUrl;

  const CueCard({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Event Title
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Event Date and Location
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                SizedBox(width: 8),
                Text(
                  date,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                Spacer(),
                Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                SizedBox(width: 8),
                Text(
                  location,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Event Description
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            SizedBox(height: 16),
            // Learn More Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Add navigation or action here
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Learn More"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
