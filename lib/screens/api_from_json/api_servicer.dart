import 'dart:convert';

import 'package:wallpapers_app/screens/api_from_json/single_post_with_modle.dart';
import 'package:http/http.dart' as http;

import 'list_formate/modle_class_of_list.dart';
class ApiServicer{
  Future<SinglePost?> getSinglrPostWithModle()async{
    try{
      var uri=Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
      var responce=await http.get(uri);
      SinglePost poster=SinglePost.fromJson(jsonDecode(responce.body));
      return poster;

    }catch(e){print(e.toString());}

  }
  Future<List<ModleClassOfList>?> getMultiplePPostData()async{
    try{
      var responde=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if(responde.statusCode==200){
       List<ModleClassOfList> modle=List<ModleClassOfList>.from(jsonDecode(responde.body).map((e)=>ModleClassOfList.fromMap(e)));
       return modle;
      }
    }catch(e){print(e.toString());}
  }

}