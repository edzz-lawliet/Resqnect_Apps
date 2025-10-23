import 'package:flutter/material.dart';
import 'dashboard_responder.dart';
import 'reports_page.dart';
import 'updates_page.dart';
import 'chat_page.dart';
import 'profile_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool locationSharingEnabled = true;

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
            // Navigate back to dashboard or previous page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardResponder()),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.all(24),
          width: 340,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 16,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.black54),
                    onPressed: () {
                      // Navigate back to dashboard when close is pressed
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardResponder(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: Icon(
                  Icons.person_outline,
                  color: Colors.deepPurple[400],
                ),
                title: const Text('Profile'),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.black54,
                ),
                onTap: () {
                  // Navigate to profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResponderProfilePage(),
                    ),
                  );
                },
                contentPadding: EdgeInsets.zero,
              ),
              SwitchListTile(
                secondary: Icon(
                  Icons.notifications_none,
                  color: Colors.deepPurple[400],
                ),
                title: const Text('Enable Notifications'),
                value: notificationsEnabled,
                onChanged: (val) {
                  setState(() => notificationsEnabled = val);
                  // Show snackbar to confirm change
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        val
                            ? 'Notifications enabled'
                            : 'Notifications disabled',
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                contentPadding: EdgeInsets.zero,
                activeThumbColor: Colors.deepPurple[400],
              ),
              SwitchListTile(
                secondary: Icon(
                  Icons.location_on_outlined,
                  color: Colors.deepPurple[400],
                ),
                title: const Text('Location Sharing'),
                value: locationSharingEnabled,
                onChanged: (val) {
                  setState(() => locationSharingEnabled = val);
                  // Show snackbar to confirm change
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        val
                            ? 'Location sharing enabled'
                            : 'Location sharing disabled',
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                contentPadding: EdgeInsets.zero,
                activeThumbColor: Colors.deepPurple[400],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    'Log out',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    // Show logout confirmation dialog
                    _showLogoutDialog();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        currentIndex: 4,
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
              // Already on Settings
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

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                // Here you would typically clear user session and navigate to login
                // For now, just show a message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logged out successfully'),
                    duration: Duration(seconds: 2),
                  ),
                );
                // Navigate to login page (you can implement this later)
                // Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Logout', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
