import 'package:flutter/material.dart';
import 'dashboard_responder.dart';
import 'updates_page.dart';
import 'chat_page.dart';
import 'settings_page.dart'; // Use responder settings instead of user settings

class LogBookPage extends StatelessWidget {
  const LogBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            'Reports & Log Book',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.pink,
            tabs: [
              Tab(text: 'Reports'),
              Tab(text: 'Log Book'),
              Tab(text: 'Unsaved Logs'),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search incidents...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Reports Tab
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ListTile(
                          leading: const Icon(
                            Icons.report,
                            color: Colors.orange,
                          ),
                          title: Text('Report #${index + 1}'),
                          subtitle: Text(
                            'Emergency report details #${index + 1}',
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Show report details
                            _showReportDetails(context, index);
                          },
                        ),
                      );
                    },
                  ),
                  // Log Book Tab
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ListTile(
                          leading: const Icon(Icons.book, color: Colors.blue),
                          title: Text('Log Entry #${index + 1}'),
                          subtitle: Text('Activity log details #${index + 1}'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Show log details
                            _showLogDetails(context, index);
                          },
                        ),
                      );
                    },
                  ),
                  // Unsaved Logs Tab
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ListTile(
                          leading: const Icon(
                            Icons.drafts,
                            color: Colors.amber,
                          ),
                          title: Text('Unsaved Log #${index + 1}'),
                          subtitle: Text('Draft log entry #${index + 1}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.save,
                                  color: Colors.green,
                                ),
                                onPressed: () {
                                  // Save the log
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Log ${index + 1} saved!'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  // Show delete confirmation
                                  _showDeleteConfirmation(context, index);
                                },
                              ),
                            ],
                          ),
                          onTap: () {
                            // Edit the unsaved log
                            _showEditDialog(context, index);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.black54,
          showUnselectedLabels: true,
          currentIndex: 1, // Reports tab
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardResponder()),
                );
                break;
              case 1:
                // Already on Reports/LogBook
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
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ), // Fixed to use responder settings
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
      ),
    );
  }

  // Helper method to show report details
  static void _showReportDetails(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Report #${index + 1} Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Report ID: RPT-${index + 1001}'),
              const SizedBox(height: 8),
              const Text('Type: Emergency Report'),
              const Text('Status: Under Review'),
              const SizedBox(height: 8),
              const Text('Description: '),
              Text(
                'This is the detailed description of emergency report #${index + 1}.',
              ),
              const SizedBox(height: 8),
              const Text('Actions Taken: '),
              Text('1. Action one details\n2. Action two details'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Helper method to show log details
  static void _showLogDetails(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Entry #${index + 1} Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Log ID: LOG-${index + 2001}'),
              const SizedBox(height: 8),
              const Text('Date: 2023-10-01'),
              const Text('Responder: John Doe'),
              const SizedBox(height: 8),
              const Text('Details: '),
              Text(
                'This is the detailed information about log entry #${index + 1}.',
              ),
              const SizedBox(height: 8),
              const Text('Follow-up Actions: '),
              Text('1. Follow-up action one\n2. Follow-up action two'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Helper method to show delete confirmation
  static void _showDeleteConfirmation(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Confirmation'),
          content: Text(
            'Are you sure you want to delete Unsaved Log #${index + 1}?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform the delete action
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Helper method to show edit dialog
  static void _showEditDialog(BuildContext context, int index) {
    final TextEditingController controller = TextEditingController();
    controller.text = 'Draft log entry #${index + 1}';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Unsaved Log #${index + 1}'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Enter log details',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Save the edited log
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
