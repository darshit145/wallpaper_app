class ModleClassOfList{
  int? userId;
  int? id;
  String? title;
  String? body;
  ModleClassOfList({required this.id,required this.title,required this.body,required this.userId});

  ModleClassOfList.fromMap(Map<String,dynamic> json){
    userId=json['userId'];
    id=json['id'];
    title=json['title'];
    body=json['body'];
  }

  Map<String,dynamic> datas(){
     Map<String,dynamic> data=Map();
    data['userId']=this.userId;
    data['id']=this.id;
    data['title']=this.title;
    data['body']=this.body;
    return data;
  }



}
