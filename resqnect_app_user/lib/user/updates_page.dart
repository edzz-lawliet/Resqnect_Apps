import 'package:flutter/material.dart';
import 'dashboard_users.dart';
import 'report_page.dart';
import 'friends_page.dart';
import 'settings_page.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

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
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Updates',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              _showNotificationSettings(context);
            },
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
                    'Hello, Edz!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardUsers(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Reports'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Updates'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Friends'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const FriendsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter tabs
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  _buildFilterChip('All', true),
                  const SizedBox(width: 8),
                  _buildFilterChip('High Priority', false),
                  const SizedBox(width: 8),
                  _buildFilterChip('Recent', false),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF8B5CF6).withOpacity(0.2),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final announcements = [
                      {
                        'title': 'Fire Incident Alert',
                        'description':
                            'Emergency response in progress at Pelmoka Street. Fire department on scene.',
                        'reportId': 'FI-1001',
                        'dateTime': 'October 16, 2024 8:23 AM',
                        'location': 'Pelmoka Street, District 5',
                        'severity': 'High',
                        'responseTeam': 'Fire Department Alpha Squad',
                        'status': 'Active Response',
                        'category': 'Fire Emergency',
                        'affectedArea': 'Residential Block A-C',
                        'instructions':
                            'Avoid the area. Evacuate if within 2 blocks.',
                        'estimatedDuration': '2-4 hours',
                        'icon': Icons.local_fire_department,
                        'color': Colors.red,
                      },
                      {
                        'title': 'Flood Warning',
                        'description':
                            'Heavy rainfall causing flooding in downtown area. Road closures in effect.',
                        'reportId': 'FW-1002',
                        'dateTime': 'October 16, 2024 8:08 AM',
                        'location': 'Downtown Area, Central District',
                        'severity': 'High',
                        'responseTeam': 'Emergency Response Unit',
                        'status': 'Active Response',
                        'category': 'Weather Emergency',
                        'affectedArea': 'Downtown Commercial District',
                        'instructions':
                            'Avoid driving through flooded streets.',
                        'estimatedDuration': '6-8 hours',
                        'icon': Icons.water_damage,
                        'color': Colors.blue,
                      },
                      {
                        'title': 'Road Accident',
                        'description':
                            'Multi-vehicle accident on Highway 5. Traffic being diverted.',
                        'reportId': 'RA-1003',
                        'dateTime': 'October 16, 2024 7:48 AM',
                        'location': 'Highway 5, Mile Marker 15',
                        'severity': 'Moderate',
                        'responseTeam': 'Traffic Management Unit',
                        'status': 'Under Control',
                        'category': 'Traffic Incident',
                        'affectedArea': 'Highway 5 Eastbound',
                        'instructions':
                            'Use alternate routes: Highway 3 or Route 45.',
                        'estimatedDuration': '1-2 hours',
                        'icon': Icons.car_crash,
                        'color': Colors.orange,
                      },
                      {
                        'title': 'Medical Emergency',
                        'description':
                            'Medical emergency resolved at City Mall. Normal operations resumed.',
                        'reportId': 'ME-1004',
                        'dateTime': 'October 16, 2024 7:33 AM',
                        'location': 'City Mall, 2nd Floor Food Court',
                        'severity': 'Resolved',
                        'responseTeam': 'Medical Response Team',
                        'status': 'Resolved',
                        'category': 'Medical Emergency',
                        'affectedArea': 'City Mall Food Court',
                        'instructions': 'No action required. Area is safe.',
                        'estimatedDuration': 'Completed',
                        'icon': Icons.medical_services,
                        'color': Colors.green,
                      },
                      {
                        'title': 'Weather Alert',
                        'description':
                            'Strong wind advisory in effect. Secure outdoor items.',
                        'reportId': 'WA-1005',
                        'dateTime': 'October 16, 2024 6:33 AM',
                        'location': 'City-wide Advisory',
                        'severity': 'Low',
                        'responseTeam': 'Weather Monitoring Unit',
                        'status': 'Advisory Active',
                        'category': 'Weather Advisory',
                        'affectedArea': 'Entire City Area',
                        'instructions':
                            'Secure loose objects, avoid outdoor activities.',
                        'estimatedDuration': '12-18 hours',
                        'icon': Icons.air,
                        'color': Colors.grey,
                      },
                    ];

                    final announcement = announcements[index];

                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: (announcement['color'] as Color).withOpacity(
                              0.1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            announcement['icon'] as IconData,
                            color: announcement['color'] as Color,
                            size: 24,
                          ),
                        ),
                        title: Text(
                          announcement['title'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              announcement['description'] as String,
                              style: const TextStyle(fontSize: 13),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _getSeverityColor(
                                      announcement['severity'] as String,
                                    ).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    announcement['severity'] as String,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: _getSeverityColor(
                                        announcement['severity'] as String,
                                      ),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  _getTimeAgo(announcement['dateTime'] as String),
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          color: Colors.black54,
                        ),
                        onTap: () {
                          _showDetailedAnnouncementModal(context, announcement);
                        },
                      ),
                    );
                  },
                ),
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
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashboardUsers()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ReportPage()),
            );
          } else if (index == 2) {
            // Already on Updates page
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FriendsPage()),
            );
          } else if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Reports',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Updates'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Friends'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF8B5CF6) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black54,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void _showDetailedAnnouncementModal(
    BuildContext context,
    Map<String, dynamic> announcement,
  ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 700),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header with icon and close button
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: (announcement['color'] as Color).withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: announcement['color'] as Color,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          announcement['icon'] as IconData,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              announcement['title']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: _getSeverityColor(
                                  announcement['severity']!,
                                ).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                announcement['severity']!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: _getSeverityColor(
                                    announcement['severity']!,
                                  ),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),

                // Content
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Description
                        Text(
                          announcement['description']!,
                          style: const TextStyle(fontSize: 16, height: 1.5),
                        ),
                        const SizedBox(height: 24),

                        // Details Grid
                        _buildInfoSection('Emergency Details', [
                          _buildInfoRow('Report ID', announcement['reportId']!),
                          _buildInfoRow('Category', announcement['category']!),
                          _buildInfoRow('Status', announcement['status']!),
                          _buildInfoRow(
                            'Date & Time',
                            announcement['dateTime']!,
                          ),
                        ]),

                        const SizedBox(height: 16),

                        _buildInfoSection('Location & Impact', [
                          _buildInfoRow('Location', announcement['location']!),
                          _buildInfoRow(
                            'Affected Area',
                            announcement['affectedArea']!,
                          ),
                          _buildInfoRow(
                            'Response Team',
                            announcement['responseTeam']!,
                          ),
                          _buildInfoRow(
                            'Est. Duration',
                            announcement['estimatedDuration']!,
                          ),
                        ]),

                        const SizedBox(height: 16),

                        // Safety Instructions
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF8B5CF6).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF8B5CF6).withOpacity(0.3),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.info_outline,
                                    color: Color(0xFF8B5CF6),
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Safety Instructions',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF8B5CF6),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                announcement['instructions']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Action Buttons
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Update saved to bookmarks!'),
                                backgroundColor: Color(0xFF8B5CF6),
                              ),
                            );
                          },
                          icon: const Icon(Icons.bookmark_outline),
                          label: const Text('Save'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF8B5CF6),
                            side: const BorderSide(color: Color(0xFF8B5CF6)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Update shared with friends!'),
                                backgroundColor: Color(0xFF8B5CF6),
                              ),
                            );
                          },
                          icon: const Icon(Icons.share),
                          label: const Text('Share'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8B5CF6),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showNotificationSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Notification Settings'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchListTile(
              title: const Text('Emergency Alerts'),
              value: true,
              onChanged: (value) {},
              activeThumbColor: const Color(0xFF8B5CF6),
            ),
            SwitchListTile(
              title: const Text('Weather Updates'),
              value: true,
              onChanged: (value) {},
              activeThumbColor: const Color(0xFF8B5CF6),
            ),
            SwitchListTile(
              title: const Text('Traffic Reports'),
              value: false,
              onChanged: (value) {},
              activeThumbColor: const Color(0xFF8B5CF6),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'moderate':
        return Colors.orange;
      case 'low':
        return Colors.green;
      case 'resolved':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  String _getTimeAgo(String dateTime) {
    // Simple time ago calculation - in real app, use proper date parsing
    return '2 hours ago';
  }
}
