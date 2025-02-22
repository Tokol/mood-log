import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // TODO: Add navigation logic for each bottom nav item if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      // Optional AppBar (if you want one)
      // appBar: AppBar(
      //   title: const Text('Dashboard'),
      //   backgroundColor: Colors.black,
      // ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==============
              // MOOD ENTRIES
              // ==============
              _buildMoodEntry(time: "7 AM", faceColor: Colors.red, icon: Icons.sentiment_satisfied),
              const SizedBox(height: 8),
              _buildMoodEntry(time: "2 PM", faceColor: Colors.green, icon: Icons.sentiment_neutral),
              const SizedBox(height: 8),
              _buildMoodEntry(time: "6 PM", faceColor: Colors.green, icon: Icons.sick),
              const SizedBox(height: 16),

              // ==============
              // TO-DO SECTION
              // ==============
              const Text(
                "TO-DO",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 80, // Fixed height for horizontal list
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      _TodoItem(label: "Listen to Calm Music"),
                      _TodoItem(label: "5-Minute Breathing Exercise"),
                      _TodoItem(label: "Meditate for 10 Minutes"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // ==============
              // OBJECTIVES
              // ==============
              Container(
                padding: const EdgeInsets.all(12),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Objectives",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildBulletPoint("Discover what impacts your emotions."),
                    _buildBulletPoint("Track and measure daily stress."),
                    _buildBulletPoint("Get tailored tips using open APIs."),
                    _buildBulletPoint("Understand your mood patterns."),
                    _buildBulletPoint("Promote healthier habits for the mind."),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // ==============
      // BOTTOM NAV BAR
      // ==============
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: "Analytics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_in_talk),
            label: "Help Line",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // ===========================
  // WIDGET: Mood Entry (time + face)
  // ===========================
  Widget _buildMoodEntry({
    required String time,
    required Color faceColor,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Circular icon representing mood
          CircleAvatar(
            radius: 20,
            backgroundColor: faceColor,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Text(
            "$time Mood",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // ===========================
  // WIDGET: Bullet Point
  // ===========================
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "• ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

// ===========================
// WIDGET: To-do Item (horizontal cards)
// ===========================
class _TodoItem extends StatelessWidget {
  final String label;
  const _TodoItem({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}
