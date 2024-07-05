import 'package:flutter/material.dart';
import 'package:wallpapers_app/screens/api_from_json/api_servicer.dart';
import 'package:wallpapers_app/screens/api_from_json/single_post_with_modle.dart';
class HomeScreenForJson extends StatefulWidget {
  const HomeScreenForJson({super.key});

  @override
  State<HomeScreenForJson> createState() => _HomeScreenForJsonState();
}

class _HomeScreenForJsonState extends State<HomeScreenForJson> {
   late SinglePost _post;
   bool isReady=false;
  _gettingSinglePost(){
    isReady=true;
    ApiServicer().getSinglrPostWithModle().then((value){
      setState(() {
        _post=value!;
        isReady=false;
      });
    });
  }
  @override
  void initState(){
    super.initState();
    _gettingSinglePost();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isReady?Center(
        child: CircularProgressIndicator(),
      ):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_post.userId.toString(),style: TextStyle(color: Colors.white),),
          Text(_post.body.toString(),style: TextStyle(color: Colors.white),),
          Text(_post.title.toString(),style: TextStyle(color: Colors.white),),
          Text(_post.id.toString(),style: TextStyle(color: Colors.white),),
        ],
      )
      ,
    );
  }
}
