import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpapers_app/screens/wallpapers/full_screen_wallpaper.dart';
class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List images=[];
  int relode=1;
  fatchApi() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
        headers: {
          'Authorization':
          'XXesPZoKUXkfuGnTFEpcxVenhJ4cXPloJs5421Wc4I5KEZn1PGlHcaLS'
        }).then((value) {
      print(value.body);
      Map result=jsonDecode(value.body);
      print(result);
      setState(() {
        images=result['photos'];
      });
      print(images.length);
    });
  }
  lodeMore()async{
    setState(() {
      relode=relode+1;
    });
    String url='https://api.pexels.com/v1/curated?per_page=80&page=$relode';
    await http.get(Uri.parse(url),
        headers: {
          'Authorization':
          'XXesPZoKUXkfuGnTFEpcxVenhJ4cXPloJs5421Wc4I5KEZn1PGlHcaLS'
        }).then((value){
          Map result=jsonDecode(value.body);
          setState(() {
            images.addAll(result['photos']);
          });
    });

  }
  @override
  void initState(){
    super.initState();
    fatchApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  childAspectRatio: 2 / 3.66),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreenWallpaper(url: images[index]['src']['original']),));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white,
                      border: Border.all(
                        width: 2,
                        color: Colors.white
                      ),
                      image: DecorationImage(
                        image: NetworkImage(images[index]['src']['medium'],),
                        fit: BoxFit.fill

                      )

                                        ),
                    // child: Image.network(images[index]['src']['medium'],fit: BoxFit.fill,),
                  ),
                );
              },
            ),
          )),
          TextButton(
            onPressed: () {
              print(images);
              lodeMore();
            },

            child: Text(
              "Lode Data",
              style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
