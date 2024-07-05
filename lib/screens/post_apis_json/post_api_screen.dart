import 'package:flutter/material.dart';
import 'package:wallpapers_app/utility/customPackage/custom_class.dart';

import 'api_services_forpost.dart';
class PostApiScreen extends StatefulWidget {
  const PostApiScreen({super.key});

  @override
  State<PostApiScreen> createState() => _PostApiScreenState();
}

class _PostApiScreenState extends State<PostApiScreen> {
  TextEditingController controller=TextEditingController();
  TextEditingController controllerForPass=TextEditingController();
  late ModleClassOnPost _modleClassOnPost;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField(controller: controller, labelText: "Mail"),
            SizedBox(height: 20,),
            customTextField(controller: controllerForPass, labelText: "Pass"),
            SizedBox(height: 20,),
            customMaterialButtonWidget2(content: Text('Log In',style: TextStyle(color: Colors.white),), onTap: (){
              ApiServicesForpost().logInWithModle(controller.text.toString(),  controllerForPass.text.toString()).then((value){
                setState(() {
                  _modleClassOnPost=value;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Homee(tokrn: _modleClassOnPost.token.toString()),));
                });
              });
            })

          ],
        ),
      ),
    );
  }
}
class Homee extends StatefulWidget {
  String tokrn;
  Homee({ required this.tokrn,super.key});

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.tokrn,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
