import 'package:flutter/material.dart';
import 'dashboard_responder.dart';
import 'reports_page.dart';
import 'chat_page.dart';
import 'settings_page.dart'; // Make sure this file defines a SettingsPage widget

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigate back to dashboard
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardResponder()),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'Announcements',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAnnouncementCard(
            context,
            'Fire Alert',
            '10 mins ago, Fire reported at Pelmoka Street. Firefighters are on site.',
            Icons.local_fire_department,
            Colors.red,
          ),
          _buildAnnouncementCard(
            context,
            'Flood Warning',
            '25 mins ago, Flood warning issued for downtown area. Residents advised to evacuate.',
            Icons.waves,
            Colors.blue,
          ),
          _buildAnnouncementCard(
            context,
            'Road Accident',
            '45 mins ago, Major road accident on Highway 5. Traffic diverted.',
            Icons.car_crash,
            Colors.orange,
          ),
          _buildAnnouncementCard(
            context,
            'Medical Emergency',
            '1 hour ago, Medical emergency response team dispatched to City Center.',
            Icons.medical_services,
            Colors.green,
          ),
          _buildAnnouncementCard(
            context,
            'Earthquake Alert',
            '2 hours ago, Minor earthquake detected. No damage reported.',
            Icons.vibration,
            Colors.brown,
          ),
          _buildAnnouncementCard(
            context,
            'Weather Update',
            '3 hours ago, Severe weather warning. Strong winds expected.',
            Icons.cloud,
            Colors.grey,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DashboardResponder()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ReportsPage()),
              );
              break;
            case 2:
              // Already on Updates
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
                MaterialPageRoute(builder: (context) => SettingsPage()),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color iconColor,
  ) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // Show announcement details when tapped
          _showAnnouncementDetails(context, title, subtitle, icon, iconColor);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }

  void _showAnnouncementDetails(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color iconColor,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(icon, color: iconColor, size: 24),
              const SizedBox(width: 8),
              Expanded(child: Text(title)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subtitle, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              const Text(
                'Additional Information:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(_getAdditionalInfo(title)),
              const SizedBox(height: 16),
              const Text(
                'Priority Level:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getPriorityColor(title).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _getPriorityLevel(title),
                  style: TextStyle(
                    color: _getPriorityColor(title),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$title marked as acknowledged'),
                    backgroundColor: iconColor,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: iconColor),
              child: const Text(
                'Acknowledge',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  String _getAdditionalInfo(String title) {
    switch (title) {
      case 'Fire Alert':
        return 'Fire department units have been dispatched. Residents in the area should evacuate immediately. Wind conditions may spread the fire.';
      case 'Flood Warning':
        return 'Heavy rainfall has caused water levels to rise. Emergency shelters have been opened at the community center.';
      case 'Road Accident':
        return 'Multi-vehicle accident blocking traffic. Ambulances and tow trucks are on scene. Use alternate routes.';
      case 'Medical Emergency':
        return 'Mass casualty incident reported. Additional medical personnel requested. Blood donations needed.';
      case 'Earthquake Alert':
        return 'Magnitude 4.2 earthquake detected. No structural damage reported. Continue normal activities with caution.';
      case 'Weather Update':
        return 'Strong winds up to 80 km/h expected. Secure loose objects and avoid unnecessary travel.';
      default:
        return 'No additional information available at this time.';
    }
  }

  String _getPriorityLevel(String title) {
    switch (title) {
      case 'Fire Alert':
      case 'Flood Warning':
        return 'HIGH';
      case 'Road Accident':
      case 'Medical Emergency':
        return 'MEDIUM';
      case 'Earthquake Alert':
      case 'Weather Update':
        return 'LOW';
      default:
        return 'NORMAL';
    }
  }

  Color _getPriorityColor(String title) {
    switch (title) {
      case 'Fire Alert':
      case 'Flood Warning':
        return Colors.red;
      case 'Road Accident':
      case 'Medical Emergency':
        return Colors.orange;
      case 'Earthquake Alert':
      case 'Weather Update':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }
}
