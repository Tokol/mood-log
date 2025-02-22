import 'package:flutter/material.dart';

import '../../mood_form.dart';
import '../../widgets/cake_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9D9C1),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double remainingHeight = constraints.maxHeight;

          // Subtracting the height of the widgets before footer
          remainingHeight -= 150; // Adjust this value according to your widget height

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Greeting Text
                Text(
                  'Good Morning!',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 44.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                // Mood Logged Status
                Text(
                  '1/3 Mood Logged for Today',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 30),

                // Time Buttons Row with dynamic width


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CakeButton(
                            onClick: (){},
                            color: Color(0xFFFFD700),
                            title: '7 A.M',
                            icon: Icons.wb_sunny,
                            isDisabled: true),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CakeButton(
                            onClick: (){},
                            color: Color(0xFF1E90FF),
                            title: '2 P.M',
                            icon: Icons.cloud,
                            isDisabled: false),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CakeButton(
                            onClick: (){
                              // print('ok');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MoodForm()),
                              );


                            },
                            color: Color(0xFF800080),
                            title: '8 P.M',
                            icon: Icons.nights_stay,
                            isDisabled: false),
                      ),
                    ),
                  ],
                ),
                // Footer Text, placed based on available space

                Spacer(flex: remainingHeight > 50 ? 1 : 0), // Adds space to bottom if there's room
                Text(
                  'Tap the time to log your mood!',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                Expanded(child: Container(



                )),

              ],
            ),
          );
        },
      ),
    );
  }
}