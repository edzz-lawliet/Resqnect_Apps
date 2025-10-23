import 'package:flutter/material.dart';
import 'dashboard_responder.dart';
import 'reports_page.dart';
import 'updates_page.dart';
import 'settings_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

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
          'Chats',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 16),
        children: [
          _buildChatTile(
            context,
            'CDRRMO GC',
            'Responder: yehey',
            '6:23',
            'D',
            Colors.pink[300]!,
          ),
          _buildChatTile(
            context,
            'Emergency Team Alpha',
            'Team Leader: Ready for deployment',
            '5:45',
            'E',
            Colors.blue[300]!,
          ),
          _buildChatTile(
            context,
            'Fire Department',
            'Fire Chief: All units available',
            '4:12',
            'F',
            Colors.red[300]!,
          ),
          _buildChatTile(
            context,
            'Medical Response',
            'Medic: Ambulance en route',
            '3:30',
            'M',
            Colors.green[300]!,
          ),
          _buildChatTile(
            context,
            'Police Station',
            'Officer: Patrol units dispatched',
            '2:15',
            'P',
            Colors.orange[300]!,
          ),
          _buildChatTile(
            context,
            'Rescue Team Bravo',
            'Coordinator: Standing by',
            '1:45',
            'R',
            Colors.purple[300]!,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        currentIndex: 3,
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
              // Already on Chat
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

  Widget _buildChatTile(
    BuildContext context,
    String title,
    String subtitle,
    String time,
    String avatar,
    Color avatarColor,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: avatarColor,
        child: Text(
          avatar,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Text(time, style: const TextStyle(color: Colors.black54)),
      onTap: () {
        // Navigate to individual chat when implemented
        _showChatDialog(context, title);
      },
    );
  }

  void _showChatDialog(BuildContext context, String chatName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: _getChatColor(chatName),
                radius: 16,
                child: Text(
                  chatName[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(chatName, style: const TextStyle(fontSize: 18)),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Opening chat with $chatName'),
              const SizedBox(height: 16),
              const Text(
                'Chat Features:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('• Real-time messaging'),
              const Text('• File sharing'),
              const Text('• Emergency alerts'),
              const Text('• Location sharing'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue[600], size: 20),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Chat functionality will be available soon',
                        style: TextStyle(fontSize: 12),
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
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$chatName added to favorites'),
                    backgroundColor: _getChatColor(chatName),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _getChatColor(chatName),
              ),
              child: const Text(
                'Add to Favorites',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Color _getChatColor(String chatName) {
    switch (chatName) {
      case 'CDRRMO GC':
        return Colors.pink[300]!;
      case 'Emergency Team Alpha':
        return Colors.blue[300]!;
      case 'Fire Department':
        return Colors.red[300]!;
      case 'Medical Response':
        return Colors.green[300]!;
      case 'Police Station':
        return Colors.orange[300]!;
      case 'Rescue Team Bravo':
        return Colors.purple[300]!;
      default:
        return Colors.grey[300]!;
    }
  }
}
