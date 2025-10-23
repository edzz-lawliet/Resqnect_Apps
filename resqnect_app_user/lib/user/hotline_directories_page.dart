import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dashboard_users.dart';
import 'report_page.dart';
import 'settings_page.dart';
import 'updates_page.dart';

class HotlineDirectoriesPage extends StatelessWidget {
  const HotlineDirectoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Hotline Directories',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white, size: 30),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Profile',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View and edit your profile',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardUsers(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Hotline Directories'),
              onTap: () => Navigator.pop(context), // Current page
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Report Incident'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.refresh),
              title: const Text('Updates'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const UpdatesPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('Map'),
              onTap: () {
                Navigator.pop(context);
                _showComingSoonDialog(context, 'Map');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help & Support'),
              onTap: () {
                Navigator.pop(context);
                _showHelpDialog(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Science City of Muñoz Hotlines',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            _HotlineItem(
              color: Colors.blue,
              letter: 'A',
              title: 'Philippine National Police',
              subtitle:
                  'Science City of Muñoz, Nueva Ecija, Region 3\n1.2 Kilometers away',
              phoneNumber: '117',
              onTap: () => _showHotlineModal(
                context,
                'Philippine National Police',
                '117',
                'Emergency police assistance and crime reporting',
              ),
            ),
            const SizedBox(height: 10),
            _HotlineItem(
              color: Colors.orange,
              letter: 'B',
              title: 'Bureau of Fire Protection',
              subtitle:
                  'Science City of Muñoz, Nueva Ecija, Region 3\n1.0 Kilometers away',
              phoneNumber: '116',
              onTap: () => _showHotlineModal(
                context,
                'Bureau of Fire Protection',
                '116',
                'Fire emergency response and rescue operations',
              ),
            ),
            const SizedBox(height: 10),
            _HotlineItem(
              color: Colors.green,
              letter: 'C',
              title: 'Disaster Risk Reduction Management',
              subtitle:
                  'Science City of Muñoz, Nueva Ecija, Region 3\n1.2 Kilometers away',
              phoneNumber: '(044) 456-0123',
              onTap: () => _showHotlineModal(
                context,
                'Disaster Risk Reduction Management',
                '(044) 456-0123',
                'Disaster preparedness and emergency response coordination',
              ),
            ),
            const SizedBox(height: 10),
            _HotlineItem(
              color: Colors.pink,
              letter: 'D',
              title: 'OSLAM',
              subtitle:
                  'Barangay Linglingay, SCM, Nueva Ecija\n5.4 Kilometers away',
              phoneNumber: '911',
              onTap: () => _showHotlineModal(
                context,
                'OSLAM',
                '911',
                'Office of Senior Citizens Affairs and Medical assistance',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        currentIndex: 3,
        onTap: (index) => _handleBottomNavigation(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Report',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: 'Updates'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Map'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  void _showHotlineModal(
    BuildContext context,
    String title,
    String phoneNumber,
    String description,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              const Icon(Icons.phone, color: Colors.red),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.phone, color: Colors.blue),
                    const SizedBox(width: 10),
                    Text(
                      phoneNumber,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                _makePhoneCall(phoneNumber);
              },
              icon: const Icon(Icons.phone),
              label: const Text('Call Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }

  void _handleBottomNavigation(BuildContext context, int index) {
    switch (index) {
      case 0: // Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardUsers()),
        );
        break;
      case 1: // Report
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ReportPage()),
        );
        break;
      case 2: // Updates
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UpdatesPage()),
        );
        break;
      case 3: // Map (current page - hotline directories)
        // Do nothing, we're already on this page
        break;
      case 4: // Settings
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SettingsPage()),
        );
        break;
    }
  }

  void _showComingSoonDialog(BuildContext context, String feature) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Row(
            children: [
              Icon(Icons.construction, color: Colors.orange),
              SizedBox(width: 10),
              Text('Coming Soon'),
            ],
          ),
          content: Text('$feature feature is coming soon!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Row(
            children: [
              Icon(Icons.help, color: Colors.blue),
              SizedBox(width: 10),
              Text('Help & Support'),
            ],
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Need help using ResQnect?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('• Tap any hotline to view details and call directly'),
              Text('• Use the Report feature to submit incident reports'),
              Text('• Check Updates for emergency alerts'),
              Text('• Access Settings to customize your preferences'),
              SizedBox(height: 15),
              Text(
                'Contact Support:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Email: support@resqnect.com'),
              Text('Phone: (044) 123-4567'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _makePhoneCall('(044) 123-4567');
              },
              child: const Text('Call Support'),
            ),
          ],
        );
      },
    );
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      // Handle error - could show a snackbar or dialog
      print('Could not launch $phoneNumber');
    }
  }
}

class _HotlineItem extends StatelessWidget {
  final Color color;
  final String letter;
  final String title;
  final String subtitle;
  final String phoneNumber;
  final VoidCallback onTap;

  const _HotlineItem({
    required this.color,
    required this.letter,
    required this.title,
    required this.subtitle,
    required this.phoneNumber,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Text(
                letter,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 16, color: color),
                      const SizedBox(width: 4),
                      Text(
                        phoneNumber,
                        style: TextStyle(
                          fontSize: 14,
                          color: color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}
