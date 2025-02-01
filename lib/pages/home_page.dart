import 'package:flutter/material.dart';
import 'package:banap/base_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'BANA',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeaderSection(),
            _buildLogoSection(),
            _buildGoalsSection(),
            const SizedBox(height: 20),
            _buildInfoCardsSection(context),
            const SizedBox(height: 30),
            _buildEmpoweringCommunitiesSection(),
            _buildBanaHelpsSection(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      color: Colors.blue[900], // Dark blue background
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          'Baltimore Association of Nepalese in America',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'CustomFont', // Custom font
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(
        'assets/work.jpg', // Add your logo image in the assets folder and mention the correct path here.
        height: 300,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildGoalsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Goals and Vision:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'CustomFont', // Custom font
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'The Baltimore Association of Nepalese in America (BANA), established in 2005, is a nonprofit dedicated to preserving Nepali culture in the U.S. Based in Baltimore, BANA promotes Nepali traditions and fosters fellowship among Nepali Americans and other communities in the area. As a leading organization, it works for the welfare of the Nepali American community in Baltimore and Maryland, partnering with local and state governments on various empowerment programs and projects.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'CustomFont', // Custom font
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCardsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoCard(
            context,
            title: 'Over 1M people',
            description:
                'Served more than 1 Million since 2005 through various mood, digitally and in-person',
            logo: Icons.people,
          ),
          _buildInfoCard(
            context,
            title: '10,000+ People',
            description:
                'Every year 10000+ get connected in BANA through, Event and Services',
            logo: Icons.event,
          ),
          _buildInfoCard(
            context,
            title: '2400+ Members',
            description:
                'Over 2,400 individuals are currently active members of BANA.',
            logo: Icons.group,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context,
      {required String title,
      required String description,
      required IconData logo}) {
    return Expanded(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                logo,
                size: 40,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CustomFont', // Custom font
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'CustomFont', // Custom font
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmpoweringCommunitiesSection() {
    return Container(
      color: Colors.blue[900], // Dark blue background
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Empowering Communities Through Education, Wellness, And Support',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'CustomFont', // Custom font
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'BANA\'s holistic approach focuses on empowering individuals and communities through education, wellness programs, and dedicated support initiatives. By fostering a sense of unity and collaboration, BANA aims to create sustainable and impactful changes for the Nepali-American community and beyond.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'CustomFont', // Custom font
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBanaHelpsSection() {
    return Container(
      color: Colors.yellow[100], // Pale yellow background
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'BANA Helps People in Need in Our Community',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'CustomFont', // Custom font
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'From supporting families during difficult times to organizing events that bring our community together, BANA remains committed to helping those in need. Our efforts include food drives, financial aid, and educational resources to uplift the most vulnerable in our community.',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontFamily: 'CustomFont', // Custom font
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
