import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiServicesForpost{
  Future<dynamic> logInWithModle(String mail,String pass)async{
    var url=Uri.parse('https://reqres.in/api/login');
    //https://reqres.in/api/login 
    var response=await http.post(url,body: {

      "email": mail,
      "password": pass,
    });
    if(response.statusCode==200){

     try{
       ModleClassOnPost post=ModleClassOnPost.fromJson( jsonDecode(response.body));
       print("LLLLLLLLLLLLLLLLLLLLLLLLLLLL");

       return post;
     }catch(e){
       print("kkkkkkkkkkkkkkkkkk");
     }
    }

  }

}
class ModleClassOnPost {
  String? token;

  ModleClassOnPost({this.token});

  ModleClassOnPost.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}