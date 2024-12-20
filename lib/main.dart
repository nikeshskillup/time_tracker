import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/time_entry_provider.dart';
import 'providers/project_task_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TimeEntryProvider()),
        ChangeNotifierProvider(create: (_) => ProjectTaskProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
