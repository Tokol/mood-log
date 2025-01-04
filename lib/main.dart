import 'package:flutter/material.dart';
import 'package:mood_log/widgets/cake_button.dart';

import 'mood_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Log',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen()
    );
  }
}



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


