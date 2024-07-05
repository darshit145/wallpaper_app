import 'dart:convert';
import 'package:http/http.dart' as  http;
class PostServices{
  Future<dynamic> getJobs(String name,String job)async{
   try{
     var url=await http.post(Uri.parse("https://reqres.in/api/users"),body:{
       "name": "$name",
       "job": "$job"
     } );
     if(url.statusCode==200 || url.statusCode==201){
       var decode=await jsonDecode(url.body);
       CreateJobModle obj= CreateJobModle.fromJson(decode);
       return obj;

     }
     // var responce=jsonDecode(url.body);
     // return "oko";
   }catch(w){
     print("dddsvvvvvvvvvvvvvvvvvv");
   }

  }
}


class CreateJobModle {
  String? name;
  String? job;
  String? id;
  String? createdAt;

  CreateJobModle({this.name, this.job, this.id, this.createdAt});

  CreateJobModle.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['job'] = this.job;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    return data;
  }
}