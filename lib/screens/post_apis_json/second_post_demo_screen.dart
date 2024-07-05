import 'package:flutter/material.dart';
import 'package:wallpapers_app/screens/post_apis_json/post_services.dart';
import 'package:wallpapers_app/utility/customPackage/custom_class.dart';
class SecondPostDemoScreen extends StatefulWidget {
  const SecondPostDemoScreen({super.key});

  @override
  State<SecondPostDemoScreen> createState() => _SecondPostDemoScreenState();
}

class _SecondPostDemoScreenState extends State<SecondPostDemoScreen> {
  TextEditingController controller  =TextEditingController();
  TextEditingController controllerForJob  =TextEditingController();
  bool isLoader=true;
  late CreateJobModle _createJobModle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child:isLoader? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField(controller: controller, labelText: "Enter Name"),
            SizedBox(height: 15,),
            customTextField(controller: controllerForJob, labelText: "Enter Job"),
            SizedBox(height: 15,),
            customMaterialButtonWidget2(content: Text("Join",style: TextStyle(color: Colors.white),), onTap: (){

              PostServices().getJobs(controller.text.toString(), controllerForJob.text.toString()).then((value){
                setState(() {
                  _createJobModle=value;
                  isLoader=false;
                });
              }).onError((error, stackTrace) {
                print("ERROrrrrrrrrrrrrrrrrrr");
              },);
            })
          ],
        ):Column(children: [
          Text(_createJobModle.name.toString(),),
          SizedBox(height: 10,),
          Text(_createJobModle.job.toString(),),
          SizedBox(height: 10,),

          Text(_createJobModle.id.toString(),),
          SizedBox(height: 10,),

          Text(_createJobModle.createdAt.toString(),),
        ],),
      ),
    );
  }
}
