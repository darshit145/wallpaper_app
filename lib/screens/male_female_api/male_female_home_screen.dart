import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MaleFemaleHomeScreen extends StatefulWidget {
  const MaleFemaleHomeScreen({super.key});

  @override
  State<MaleFemaleHomeScreen> createState() => _MaleFemaleHomeScreenState();
}

class _MaleFemaleHomeScreenState extends State<MaleFemaleHomeScreen> with SingleTickerProviderStateMixin {
  List male=[];
  List Female=[];
  void dataSet(List li){
    for(var r in li){
      if(r.gender == 'male'){
        male.add(r);
      }else{
        Female.add(r);
      }
    }
  }

  late ModalClass _modalClass;
  _gettingUsersList(){
    ApiServices().getUserList().then((value){
      _modalClass=value!;
      // print(value!);
      dataSet(_modalClass.users as List);
    });
  }
  late TabController _controller;
  void initState(){
    super.initState();
    _gettingUsersList();
    _controller=TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            print(male);
          });
        },

      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Male AND Female"),
        bottom: TabBar(

          controller: _controller,
          tabs: [
            Tab(child: Text('Male'),),
            Tab(child: Text('FeMale'),)
          ],
        ),

      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Container(
            child: ListView.builder(itemCount: male.length, itemBuilder: (context, index) {
              return ListTile(
                leading: Text(male[index].id.toString(),style: TextStyle(color: Colors.white),),
                title: Text(male[index].firstName,style: TextStyle(color: Colors.white),),
                subtitle: Text("${male[index].maidenName}" "${male[index].firstName}" "${male[index].lastName}",style: TextStyle(color: Colors.white),),

              );
            },),
          ),
          Container(
            child: ListView.builder(itemCount: Female.length,itemBuilder: (context, index) {
              return ListTile(
                leading: Text(Female[index].id.toString(),style: TextStyle(color: Colors.white),),
                title: Text(Female[index].firstName,style: TextStyle(color: Colors.white),),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text('Hair Colors '),
                      Text('${Female[index].hair.color}'"and"" ${Female[index].hair.type}")
                    ],),
                    Text("${Female[index].maidenName}"  "${Female[index].firstName}" "${Female[index].lastName}",style: TextStyle(color: Colors.white),),
                  ],
                ),
                

              );
            },),
          ),
        ],

      ),
    );
  }
}
class ApiServices{
  Future<ModalClass?> getUserList()async{
    var responce=await http.get(Uri.parse('https://dummyjson.com/users'));
    if(responce.statusCode==200){
      print(responce.body);
      // return jsonDecode(responce.body);
      return ModalClass.fromJson(jsonDecode(responce.body));
    }
  }

}

class ModalClass {
  List<Users>? users;
  int? total;
  int? skip;
  int? limit;

  ModalClass({this.users, this.total, this.skip, this.limit});

  ModalClass.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Users {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  double? height;
  dynamic? weight;
  String? eyeColor;
  Hair? hair;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;
  Crypto? crypto;
  String? role;

  Users({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
    this.crypto,
    this.role,
  });

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = json['maidenName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    birthDate = json['birthDate'];
    image = json['image'];
    bloodGroup = json['bloodGroup'];
    height = json['height'];
    weight = json['weight'];
    eyeColor = json['eyeColor'];
    hair = json['hair'] != null ? Hair.fromJson(json['hair']) : null;
    ip = json['ip'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    macAddress = json['macAddress'];
    university = json['university'];
    bank = json['bank'] != null ? Bank.fromJson(json['bank']) : null;
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
    ein = json['ein'];
    ssn = json['ssn'];
    userAgent = json['userAgent'];
    crypto = json['crypto'] != null ? Crypto.fromJson(json['crypto']) : null;
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['maidenName'] = maidenName;
    data['age'] = age;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['username'] = username;
    data['password'] = password;
    data['birthDate'] = birthDate;
    data['image'] = image;
    data['bloodGroup'] = bloodGroup;
    data['height'] = height;
    data['weight'] = weight;
    data['eyeColor'] = eyeColor;
    if (hair != null) {
      data['hair'] = hair!.toJson();
    }
    data['ip'] = ip;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['macAddress'] = macAddress;
    data['university'] = university;
    if (bank != null) {
      data['bank'] = bank!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    data['ein'] = ein;
    data['ssn'] = ssn;
    data['userAgent'] = userAgent;
    if (crypto != null) {
      data['crypto'] = crypto!.toJson();
    }
    data['role'] = role;
    return data;
  }
}

class Hair {
  String? color;
  String? type;

  Hair({this.color, this.type});

  Hair.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['color'] = color;
    data['type'] = type;
    return data;
  }
}

class Address {
  String? address;
  String? city;
  String? state;
  String? stateCode;
  String? postalCode;
  Coordinates? coordinates;
  String? country;

  Address({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    state = json['state'];
    stateCode = json['stateCode'];
    postalCode = json['postalCode'];
    coordinates = json['coordinates'] != null ? Coordinates.fromJson(json['coordinates']) : null;
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['stateCode'] = stateCode;
    data['postalCode'] = postalCode;
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    data['country'] = country;
    return data;
  }
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({this.lat, this.lng});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class Bank {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Bank({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  Bank.fromJson(Map<String, dynamic> json) {
    cardExpire = json['cardExpire'];
    cardNumber = json['cardNumber'];
    cardType = json['cardType'];
    currency = json['currency'];
    iban = json['iban'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['cardExpire'] = cardExpire;
    data['cardNumber'] = cardNumber;
    data['cardType'] = cardType;
    data['currency'] = currency;
    data['iban'] = iban;
    return data;
  }
}

class Company {
  String? department;
  String? name;
  String? title;
  Address? address;

  Company({this.department, this.name, this.title, this.address});

  Company.fromJson(Map<String, dynamic> json) {
    department = json['department'];
    name = json['name'];
    title = json['title'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['department'] = department;
    data['name'] = name;
    data['title'] = title;
    if (address != null) {
      data['address'] = address!.toJson();
    }    return data;
  }
}

class Crypto {
  String? coin;
  String? wallet;
  String? network;

  Crypto({this.coin, this.wallet, this.network});

  Crypto.fromJson(Map<String, dynamic> json) {
    coin = json['coin'];
    wallet = json['wallet'];
    network = json['network'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['coin'] = coin;
    data['wallet'] = wallet;
    data['network'] = network;
    return data;
  }
}



