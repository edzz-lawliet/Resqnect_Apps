import 'package:flutter/material.dart';
import 'reports_page.dart'; 
import 'updates_page.dart';
import 'chat_page.dart';
import 'settings_page.dart' as responder_settings;
import 'profile_page.dart';

class DashboardResponder extends StatelessWidget {
  const DashboardResponder({super.key});

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
          'Home Page',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ResQnect',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 12),
                  Icon(Icons.account_circle, size: 54, color: Colors.black54),
                  SizedBox(height: 8),
                  Text(
                    'Hello, Responder!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Text('General', style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                // Already on home page
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: const Text('Directories'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to directories page when created
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Text(
                'Emergency Guides',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.medical_services_outlined),
              title: const Text('First Aid Tips'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to First Aid Tips page when created
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_fire_department_outlined),
              title: const Text('Fire Safety Tips'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Fire Safety Tips page when created
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('CPR'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to CPR page when created
              },
            ),
            ListTile(
              leading: const Icon(Icons.shield_outlined),
              title: const Text('Personal Safety'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Personal Safety page when created
              },
            ),
            ListTile(
              leading: const Icon(Icons.psychology_outlined),
              title: const Text('Mental Health'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Mental Health page when created
              },
            ),
            ListTile(
              leading: const Icon(Icons.more_horiz),
              title: const Text('More Guides'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to More Guides page when created
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Text('Account', style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('User Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResponderProfilePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.group_outlined),
              title: const Text('Friends'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Friends page when created
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Text('App', style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('About CDRRMO'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to About CDRRMO page when created
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Privacy Policy page when created
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About App'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to About App page when created
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weather Row
            Row(
              children: const [
                Icon(Icons.wb_sunny_outlined, color: Colors.amber, size: 24),
                SizedBox(width: 8),
                Text('25°C Sunny No alerts', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 16),
            // Landscape Image (matching your screenshot)
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF87CEEB), // Sky blue
                    Color(0xFFFFB6C1), // Light pink/sunset
                    Color(0xFF98FB98), // Pale green
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                children: [
                  // Mountain silhouettes
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: CustomPaint(
                      size: Size(double.infinity, 40),
                      painter: MountainPainter(),
                    ),
                  ),
                  // Trees
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Icon(Icons.park, color: Colors.green[800], size: 30),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 20,
                    child: Icon(Icons.park, color: Colors.green[800], size: 30),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to Evacuation Map when created
                    },
                    child: const Text('Evacuation Map'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to Hotline Directories when created
                    },
                    child: const Text('Hotline Directories'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Announcements
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'ANNOUNCEMENTS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Evacuation Notice',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'October 01, 2024 7:00 AM',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Please fill in the fields and enable location services for accurate tracking. Video uploads are limited to 5 seconds.',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
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
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              // Already on Home
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ReportsPage(),
                ), // Changed to ReportsPage
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UpdatesPage()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => responder_settings.SettingsPage()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Reports',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Updates'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// Custom painter for mountain silhouettes
class MountainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[600]!
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width * 0.2, size.height * 0.3);
    path.lineTo(size.width * 0.4, size.height * 0.7);
    path.lineTo(size.width * 0.6, size.height * 0.2);
    path.lineTo(size.width * 0.8, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
