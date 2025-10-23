import 'package:flutter/material.dart';
import 'dashboard_users.dart';
import 'report_page.dart';
import 'updates_page.dart';
import 'friends_page.dart';
import 'settings_page.dart';

class EmergencyGuidesPage extends StatelessWidget {
  const EmergencyGuidesPage({super.key});

  void _showGuideModal(
    BuildContext context,
    String title,
    List<String> steps,
    String description,
    IconData icon,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B5CF6).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        color: const Color(0xFF8B5CF6),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Description
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),

                // Steps
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Step-by-Step Guide:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...steps.asMap().entries.map((entry) {
                          int index = entry.key;
                          String step = entry.value;
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF8B5CF6),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    step,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),

                // Action Buttons
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Guide bookmarked!'),
                              backgroundColor: Color(0xFF8B5CF6),
                            ),
                          );
                        },
                        icon: const Icon(Icons.bookmark_outline),
                        label: const Text('Bookmark'),
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
                              content: Text('Guide shared!'),
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
              ],
            ),
          ),
        );
      },
    );
  }

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashboardUsers()),
            );
          },
        ),
        centerTitle: false,
        title: const Text(
          'Emergency Guides',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Safety Guides', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            _GuideCard(
              title: 'Natural Disaster',
              subtitle:
                  'Learn how to prepare and respond to earthquakes, floods, and hurricanes.',
              imageUrl:
                  'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
              onTap: () => _showGuideModal(
                context,
                'Natural Disaster Preparedness',
                [
                  'Stay calm and assess your surroundings immediately',
                  'Move to a safe location away from hazardous areas',
                  'If indoors during earthquake, take cover under sturdy furniture',
                  'Stay away from windows, mirrors, and heavy objects',
                  'If outdoors, move away from buildings, trees, and power lines',
                  'Listen to emergency broadcasts on radio or mobile alerts',
                  'Have an emergency kit ready with water, food, and first aid supplies',
                  'Follow evacuation orders from local authorities immediately',
                  'Check on neighbors and family members when safe to do so',
                  'Document any damage for insurance purposes after the event',
                ],
                'Natural disasters can strike without warning. Being prepared and knowing what to do can save lives and reduce injuries. This guide covers essential steps for major natural disasters including earthquakes, floods, hurricanes, and wildfires.',
                Icons.warning_amber_rounded,
              ),
            ),
            const SizedBox(height: 12),
            _GuideCard(
              title: 'Social Disaster',
              subtitle:
                  'Guidelines for handling civil unrest, violence, and social emergencies.',
              imageUrl:
                  'https://images.unsplash.com/photo-1501594907352-04cda38ebc29?auto=format&fit=crop&w=400&q=80',
              onTap: () => _showGuideModal(
                context,
                'Social Disaster Response',
                [
                  'Stay indoors and avoid areas with civil unrest or violence',
                  'Keep doors and windows locked, close curtains or blinds',
                  'Monitor news and official communications for updates',
                  'Avoid posting your location or activities on social media',
                  'Keep emergency numbers readily available on your phone',
                  'Have alternative routes planned in case you need to evacuate',
                  'Stock up on essential supplies before situations escalate',
                  'Stay in contact with family members and let them know you\'re safe',
                  'If you must go out, travel in groups and avoid crowded areas',
                  'Report any suspicious activities to local authorities',
                ],
                'Social disasters include riots, civil unrest, terrorist attacks, and other human-caused emergencies. These situations require different responses than natural disasters and often involve avoiding certain areas and staying informed.',
                Icons.groups_rounded,
              ),
            ),
            const SizedBox(height: 12),
            _GuideCard(
              title: 'Life Safety',
              subtitle:
                  'Essential life-saving techniques including CPR, choking, and basic first aid.',
              imageUrl:
                  'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80',
              onTap: () => _showGuideModal(
                context,
                'Life Safety & First Aid',
                [
                  'Check for responsiveness by tapping shoulders and shouting',
                  'Call 911 immediately or have someone else call for help',
                  'Check for breathing - look, listen, and feel for 10 seconds',
                  'If no breathing, begin CPR: 30 chest compressions, 2 breaths',
                  'For choking: perform back blows and abdominal thrusts (Heimlich)',
                  'Control bleeding by applying direct pressure with clean cloth',
                  'For burns: cool with running water, do not apply ice',
                  'Keep the person warm and comfortable while waiting for help',
                  'Do not move someone with potential spinal injuries',
                  'Stay with the person and provide reassurance until help arrives',
                ],
                'Basic life safety skills can mean the difference between life and death in emergency situations. Learn essential first aid techniques, CPR basics, and how to respond to common medical emergencies.',
                Icons.health_and_safety_rounded,
              ),
            ),
            const SizedBox(height: 12),
            _GuideCard(
              title: 'Emergency Preparedness',
              subtitle:
                  'How to prepare your home, family, and workplace for various emergencies.',
              imageUrl:
                  'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80',
              onTap: () => _showGuideModal(
                context,
                'Emergency Preparedness Planning',
                [
                  'Create a family emergency plan with meeting locations',
                  'Prepare an emergency kit with 3 days of supplies per person',
                  'Include water (1 gallon per person per day), non-perishable food',
                  'Pack flashlights, batteries, battery-powered radio, first aid kit',
                  'Keep important documents in waterproof container',
                  'Plan evacuation routes from your home and neighborhood',
                  'Identify safe rooms in your home for different emergencies',
                  'Practice emergency drills with all family members',
                  'Keep emergency contact list updated and accessible',
                  'Review and update your emergency plan every 6 months',
                ],
                'Being prepared before an emergency strikes is crucial for you and your family\'s safety. This comprehensive guide helps you create emergency plans, build emergency kits, and prepare your home for various disaster scenarios.',
                Icons.checklist_rounded,
              ),
            ),
            const SizedBox(height: 12),
            _GuideCard(
              title: 'Mental Health',
              subtitle:
                  'Managing stress, anxiety, and trauma during and after emergency situations.',
              imageUrl:
                  'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80',
              onTap: () => _showGuideModal(
                context,
                'Mental Health During Emergencies',
                [
                  'Acknowledge that feeling stressed or anxious is normal',
                  'Practice deep breathing exercises to help calm yourself',
                  'Stay connected with family and friends for emotional support',
                  'Limit exposure to news and social media about the emergency',
                  'Maintain daily routines as much as possible for stability',
                  'Get adequate sleep, eat regularly, and stay hydrated',
                  'Engage in physical activity or relaxation techniques',
                  'Seek professional help if symptoms persist or worsen',
                  'Be patient with yourself and others during recovery',
                  'Help others when you can - it can improve your own mental health',
                ],
                'Emergency situations can cause significant mental and emotional stress. Learning to cope with these feelings and knowing when to seek help is an important part of emergency preparedness and recovery.',
                Icons.psychology_rounded,
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
        currentIndex: 1,
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const UpdatesPage()),
            );
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
            label: 'Report',
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
}

class _GuideCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final VoidCallback onTap;

  const _GuideCard({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 13)),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 60,
                height: 60,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image_not_supported),
              );
            },
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

// File moved to user/emergency_guides_page.dart
