import 'package:flutter/material.dart';
import 'package:banap/base_scaffold.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'About Us',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Who We Are" Section
            _buildSection(
              title: "Who We Are",
              description:
                  "The Baltimore Association of Nepalese in America (BANA), established in 2005, is a nonprofit dedicated to preserving Nepali culture in the U.S. Based in Baltimore, BANA promotes Nepali traditions and fosters fellowship among Nepali Americans and other communities in the area. As a leading organization, it works for the welfare of the Nepali American community in Baltimore and Maryland, partnering with local and state governments on various empowerment programs and projects.",
              imagePath: 'assets/whoweare.jpg',
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),

            // "Our Mission" Section
            _buildSection(
              title: "Our Mission",
              description:
                  "Baltimore Association of Nepalese in America (BANA) is a nonprofit tax-exempt organization dedicated to introducing Nepali population since its establishment (2005), and have been committed to preserve Nepali culture and perpetuate Nepali traditions, to enhance fellowship among all the American Nepali tribes; to enlighten the public and encourage better understanding of Nepali People and make feel like home through number of cultural and social programs. BANA established its identity as a leading community organization working for the broad welfare of the community, common to all Nepali Americans in Baltimore area and in the whole state of Maryland.",
              imagePath: 'assets/mission.jpg',
              backgroundColor: Colors.grey[100]!,
              textColor: Colors.black,
            ),

            // "Our Work" Section
            _buildSection(
              title: "Our Work",
              description:
                  "BANA community members and volunteers have dedicated themselves to advance our purposes set in the mission statement and by-laws. Before the pandemic, BANA regularly hosted several activities every year, including the Summer Picnic and fall Street Festival in order to bring the Nepali community closer together and explore different cultural elements, like food, music, and dance. After the COVID-19 outbreak, BANA immediately got to work. Many members of the Nepali community in Maryland, and in other parts of the US, needed assistance with transitioning to remote work, unemployment benefits, and other financial issues. BANA regularly raises funds for important issues like helping the Nepali population affected by the pandemic, and victims of other manmade and natural disasters that are in need, all over the world. In addition, BANA helped provide hundreds of COVID tests to the Nepali community via our Community Resource Center in Parkville, MD. BANA hosted many online webinars through Zoom and Facebook Live to help with topics like Stress Management, Unemployment, and Small Business. After the vaccine was approved, BANA collaborated with Baltimore County and the State of Maryland to administer hundreds of COVID-19 shots.",
              imagePath: 'assets/work.jpg',
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),

            // "Executive Team and Management Team" Section
            _buildTeamSection(context),

            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }

  // Widget for sections without an image on the left
  Widget _buildSection({
    required String title,
    required String description,
    required String imagePath,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.0,
              color: textColor.withOpacity(0.8),
              height: 1.6,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  // Widget for the "Executive Team and Management Team" section
  Widget _buildTeamSection(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Meet Our Teams",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16.0),
          _buildTeamTile(
            context,
            title: "Executive Team",
            url: "https://banaonline.org/about-us/executive-committee/",
          ),
          const Divider(height: 32.0, thickness: 1.0),
          _buildTeamTile(
            context,
            title: "Management Team",
            url: "https://banaonline.org/about-us/management-team/",
          ),
        ],
      ),
    );
  }

  // Widget for team list tiles
  Widget _buildTeamTile(BuildContext context,
      {required String title, required String url}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16.0,
        color: Colors.black,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewPage(
              title: title,
              url: url,
            ),
          ),
        );
      },
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String title;
  final String url;

  const WebViewPage({
    required this.title,
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Text('Display WebView for $url here'),
      ),
    );
  }
}
