import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpapers_app/screens/api_from_json/api_servicer.dart';
import 'package:wallpapers_app/screens/api_from_json/list_formate/modle_class_of_list.dart';
import 'package:http/http.dart' as http;
class ListApiScreen extends StatefulWidget {
  const ListApiScreen({super.key});

  @override
  State<ListApiScreen> createState() => _ListApiScreenState();
}

class _ListApiScreenState extends State<ListApiScreen> {
   List _modleClassOfList=[];
  bool isAvalable=true;
  _withoutModdle()async{
    var respond=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if(respond.statusCode==200){
      setState(() {
        _modleClassOfList=jsonDecode(respond.body);

      });
    }
  }
  @override
  void initState(){
    super.initState();
    // _getData();
    _withoutModdle();
  }
  _getData(){
    ApiServicer().getMultiplePPostData().then((value){
      isAvalable=true;
       setState(() {
         _modleClassOfList=value!;
         // isAvalable=false;
       });
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {

          });
        },

      ),

      body: isAvalable?Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              leading: Text(_modleClassOfList[index]['id'].toString(),style: TextStyle(color: Colors.white),),
              title: Text(_modleClassOfList[index]['title'].toString(),style: TextStyle(color: Colors.white),),
              subtitle: Text(_modleClassOfList[index]['body'].toString(),style: TextStyle(color: Colors.white,fontSize: 10),),
              trailing: Text(_modleClassOfList[index]['id'].toString()),
            );
          },itemCount: _modleClassOfList.length,),)
        ],
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}
