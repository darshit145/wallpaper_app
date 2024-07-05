import 'package:flutter/material.dart';
import 'package:wallpapers_app/screens/api_from_json/home_screen_for_json.dart';
import 'package:wallpapers_app/screens/male_female_api/male_female_home_screen.dart';
import 'package:wallpapers_app/screens/movies/movies_home_screen.dart';
import 'package:wallpapers_app/screens/post_apis_json/post_api_screen.dart';
import 'package:wallpapers_app/screens/post_apis_json/post_services.dart';
import 'package:wallpapers_app/screens/post_apis_json/second_post_demo_screen.dart';
import 'package:wallpapers_app/screens/wallpapers/my_home_screen.dart';
import 'package:wallpapers_app/utility/customPackage/custom_class.dart';

import 'api_from_json/list_formate/list_api_screen.dart';
class HomeForAllApisscreen extends StatefulWidget {
  const HomeForAllApisscreen({super.key});

  @override
  State<HomeForAllApisscreen> createState() => _HomeForAllApisscreenState();
}

class _HomeForAllApisscreenState extends State<HomeForAllApisscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            customMaterialButtonWidget2(content: Text("WallPaper",style: TextStyle(color: Colors.white),), onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomeScreen(),));
            }),
            customMaterialButtonWidget2(content: Text("Movies",style: TextStyle(color: Colors.white),), onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesHomeScreen(),));
            }),
            customMaterialButtonWidget2(content: Text("Jsons ",style: TextStyle(color: Colors.white),), onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  ListApiScreen(),));
            }),
            customMaterialButtonWidget2(content: Text("Post on Jsons ",style: TextStyle(color: Colors.white),), onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  PostApiScreen(),));
            }),
            customMaterialButtonWidget2(content: Text("Post demo 2 on Jsons ",style: TextStyle(color: Colors.white),), onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  SecondPostDemoScreen(),));
            }),
            customMaterialButtonWidget2(content: Text("Male Female",style: TextStyle(color: Colors.white),), onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  MaleFemaleHomeScreen(),));
            }),

          ],
        ),
      ),
    );
  }
}
