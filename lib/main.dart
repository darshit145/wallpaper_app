import 'package:flutter/material.dart';
import 'package:wallpapers_app/screens/home_for_all_apisscreen.dart';
import 'package:wallpapers_app/screens/wallpapers/my_home_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.black54,
        useMaterial3: true,


      ),
      home:  HomeForAllApisscreen(),
    );
  }
}
