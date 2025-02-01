import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:banap/base_scaffold.dart';

class Publications extends StatelessWidget {
  const Publications({super.key});

  void navigateToPage(BuildContext context, String title,
      {String? pdfAssetPath}) {
    if (pdfAssetPath != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFViewerPage(
            pdfAssetPath: pdfAssetPath,
            title: title,
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SectionPage(title: title),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Publications',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildSectionButton(
              context,
              title: '2021 Form 990',
              color: Colors.blue.shade800,
              textColor: Colors.white,
              pdfAssetPath: 'assets/files/form.pdf', // Updated asset path
            ),
            buildSectionButton(
              context,
              title: 'Covid-19 Report',
              color: Colors.yellow.shade200,
              textColor: Colors.black,
              pdfAssetPath: 'assets/files/covid.pdf', // Updated here
            ),
            buildSectionButton(
              context,
              title: 'Covid-19 Award Ceremony',
              color: Colors.blue.shade800,
              textColor: Colors.white,
              pdfAssetPath: null, // No PDF for this button
              onTapOverride: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThankYouPage(),
                  ),
                );
              },
            ),
            Container(
              color: Colors.yellow.shade200,
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              child: ExpansionTile(
                title: const Text(
                  'Zoom Webinars',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                children: [
                  buildSubsectionTile(
                    context,
                    title: 'Small Business/Unemployment',
                    color: Colors.blue.shade800,
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SmallBusinessScreen(),
                        ),
                      );
                    },
                  ),
                  buildSubsectionTile(
                    context,
                    title: 'Stress Management',
                    color: Colors.yellow.shade200,
                    textColor: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StressManagementScreen(),
                        ),
                      );
                    },
                  ),
                  buildSubsectionTile(
                    context,
                    title: 'Immigration/Unemployment',
                    color: Colors.blue.shade800,
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ImmigrationUnemploymentScreen(),
                        ),
                      );
                    },
                  ),
                  buildSubsectionTile(
                    context,
                    title: 'International Student',
                    color: Colors.yellow.shade200,
                    textColor: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const InternationalStudentScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionButton(
    BuildContext context, {
    required String title,
    required Color color,
    required Color textColor,
    String? pdfAssetPath,
    VoidCallback? onTapOverride,
  }) {
    return Container(
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.arrow_forward, color: textColor),
        onTap: onTapOverride ??
            () => navigateToPage(context, title, pdfAssetPath: pdfAssetPath),
      ),
    );
  }

  Widget buildSubsectionTile(
    BuildContext context, {
    required String title,
    required Color color,
    required Color textColor,
    VoidCallback? onTap,
  }) {
    return Container(
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: textColor),
        ),
        trailing: Icon(Icons.arrow_forward, color: textColor),
        onTap: onTap ??
            () => navigateToPage(context, title), // Use onTap if provided
      ),
    );
  }
}

class PDFViewerPage extends StatefulWidget {
  final String pdfAssetPath;
  final String title;

  const PDFViewerPage(
      {super.key, required this.pdfAssetPath, required this.title});

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  String? localPdfPath;

  @override
  void initState() {
    super.initState();
    _loadPdfFromAssets();
  }

  Future<void> _loadPdfFromAssets() async {
    try {
      final byteData = await rootBundle.load(widget.pdfAssetPath);
      final file = File(
        '${(await getTemporaryDirectory()).path}/${widget.pdfAssetPath.split('/').last}',
      );
      await file.writeAsBytes(byteData.buffer.asUint8List());
      setState(() {
        localPdfPath = file.path;
      });
    } catch (e) {
      print('Error loading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(75, 9, 94, 213),
      ),
      body: localPdfPath == null
          ? const Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: localPdfPath,
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: true,
              pageFling: true,
              onRender: (pages) {
                print('PDF rendered with $pages pages');
              },
              onError: (error) {
                print('Error while loading PDF: $error');
              },
              onPageChanged: (page, total) {
                print('Current page: $page of $total');
              },
            ),
    );
  }
}

class SectionPage extends StatelessWidget {
  final String title;

  const SectionPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Content for $title',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thank You!'),
        backgroundColor: const Color.fromARGB(75, 9, 94, 213),
      ),
      body: Card(
        elevation: 5.0,
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'A special Thank You',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'To all COVID-19 volunteers,'
                '\n\nThank you for your extraordinary dedication to keeping our families safe during these tough times. We are truly grateful for your help with everything, from providing financial advice, to creating countless handmade masks, to providing hundreds of free prescriptions. Please see our videos and photo gallery below about the Award Ceremony.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                'Sincerely, \n\nBaltimore Association of Nepalese in America',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallBusinessScreen extends StatelessWidget {
  const SmallBusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Small Business/Unemployment'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'COVID-19 Small Business/Unemployment Webinar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Session #1\n'
              'Unemployment र Small Business को बिषयमा हामी फेरी Attorney र CPA को साथमा BANA र DC NEPAL को FACEBOOK पेजबाट LIVE..\n'
              'केहि जिज्ञासा भएमा सम्पर्क गर्नुहोला !\n'
              '१. कुलमणी आचार्य ( Small Business ) +1 (443) 621-0477\n'
              '२. भिम बिक ( Unemployment ) +1 (443) 519-9423\n\n'
              'Date: April 26th, 2020\n'
              'Air time: 2h 14m\n\n'
              'https://www.facebook.com/183967598329066/videos/830132297475961/',
            ),
            SizedBox(height: 20.0),
            Text(
              'Session #2\n'
              'कोरोनाको महामारीले धेरै अफ्ट्यारो स्थितिको सृजना गराईरहेको छ। बेरोजगारी र साना व्यवसायीहरूलाई विभिन्न किसिमको समस्याले तनाब दिईरहेको छ। यसै बिषयमा फेरी एक पटक हामीले सम्बन्धित क्षेत्रका जानकारहरूलाई प्रत्यक्ष संवादका लागि फेसबुक\n\n'
              'Date: June 9th, 2020\n'
              'Air time: 2h 26m\n\n'
              'https://www.facebook.com/183967598329066/videos/263519074959551/',
            ),
            SizedBox(height: 20.0),
            Text(
              'Session #3\n'
              'कोरोनाको महामारीले धेरै अफ्ट्यारो स्थितिको सृजना गराईरहेको छ। बेरोजगारी र साना व्यवसायीहरूलाई विभिन्न किसिमको समस्याले तनाब दिईरहेको छ। यसै बिषयमा फेरी एक पटक हामीले सम्बन्धित क्षेत्रका जानकारहरूलाई प्रत्यक्ष संवादका लागि फेसबुक\n\n'
              'Date: July 16th, 2020\n'
              'Air time: 1h 22m\n\n'
              'https://www.facebook.com/183967598329066/videos/743073776485119/',
            ),
          ],
        ),
      ),
    );
  }
}

class StressManagementScreen extends StatelessWidget {
  const StressManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stress Management'),
        backgroundColor: Colors.yellow.shade200,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'COVID-19 Stress Management Webinar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Stress Management कसरी गर्ने ?\n'
              'बाल-बालिकाहरूमा ANXIETY कसरी थाहा पाउने ?\n'
              'विषय बिज्ञ मनोचिकित्सक डा. जगदम्बा पण्डित र बानाका महासचिव किरण ढकाल बीचको कुराकानी..\n\n'
              'Date: April 21st, 2020\n'
              'Air time: 56m\n\n'
              'https://www.facebook.com/183967598329066/videos/2641410372854529/',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class ImmigrationUnemploymentScreen extends StatelessWidget {
  const ImmigrationUnemploymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Immigration/Unemployment'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'COVID-19 Immigration/Unemployment Webinar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Immigration र unemployment को बिषयमा बिषय विज्ञको साथमा…\n\n'
              'Date: June 9th, 2020\n'
              'Air time: 2h 26m\n\n'
              'https://www.facebook.com/183967598329066/videos/283007499732703/',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class InternationalStudentScreen extends StatelessWidget {
  const InternationalStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('International Student'),
        backgroundColor: Colors.yellow.shade200,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'COVID-19 International Student Webinar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'अमेरिकामा बिदेशी विद्यार्थीहरुलाई आफ्नै देश फिर्ता पठाउने नयाँ बाध्यकारी नियम पारित भएको छ।\n'
              'नेपाली बिधार्थीहरूको अवस्थामा के हुन्छ ?\n'
              'कस्तो प्रभाव पर्छ ?\n'
              'Attorney डिल्ली भट्ट सँगको प्रत्यक्ष कुराकानी\n\n'
              'Date: June 10th, 2020\n'
              'Air time: 47m\n\n'
              'https://www.facebook.com/183967598329066/videos/3236165949775759/',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
