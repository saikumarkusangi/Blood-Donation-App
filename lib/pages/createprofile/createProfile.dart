import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {


  
  @override
  List user = List.empty();
 String name = "";

  String age = "";

  String sex = "";

  String mobilenumber = "";

  String bloodgroup = "";

  String UID = '';
 
  

  
    createUser() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("users").doc(name);
  
  Map<String, String> userList= {
     "name": name,
      "age":age,
      "sex":sex,
      "mobile number":mobilenumber,
      "blood group":bloodgroup,
      'UID':UID,

    };

    
    
    documentReference
        .set(userList)
        .whenComplete(() => print("Data stored successfully"));
        Get.toNamed('/Dashboard');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 95, 85),
   body: SafeArea(
        child: SingleChildScrollView(
  
            child: Column(
              
              children: [
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                        padding: const EdgeInsets.only(top:5.0,),
                        child: Text('----- PROFILE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
                      ),
                      
               
                   ],
                 ),
   
          Column(
            children: [
              SizedBox(height: 40,),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(180),),
                          child: Icon(Icons.person,color: Color.fromARGB(255, 245, 95, 85),size: 42,)),
                     
                              SizedBox(
                      height: 40,
                    ),
              Padding(
                  padding: const EdgeInsets.only(right: 30,left: 30),
                  child:TextField(
    cursorColor: Colors.red,
    style: TextStyle(color: Colors.black,fontSize: 18),
    decoration: InputDecoration(
      labelText: "Enter your full name",
      labelStyle: TextStyle(color: Colors.black,fontSize: 18),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white,
       contentPadding: const EdgeInsets.all(8),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
     onChanged: (String value) {
                            name = value;
                          },
    ),
                ),
                const SizedBox(
                  height: 20,
                ),
            Padding(
                  padding: const EdgeInsets.only(right: 30,left: 30),
                  child:TextField(
    cursorColor: Colors.red,
    style: TextStyle(color: Colors.black,fontSize: 18),
    decoration: InputDecoration(
      labelText: "Enter your age",
      labelStyle: TextStyle(color: Colors.black,fontSize: 18),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white,
       contentPadding: const EdgeInsets.all(8),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
     onChanged: (String value) {
                            age = value;
   
                          },
    ),
                ),
                const SizedBox(
                  height: 20,
                ),
            Padding(
                  padding: const EdgeInsets.only(right: 30,left: 30),
                  child:TextField(
    cursorColor: Colors.red,
    style: TextStyle(color: Colors.black,fontSize: 18),
    decoration: InputDecoration(
      labelText: "Enter your gender",
      labelStyle: TextStyle(color: Colors.black,fontSize: 18),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white,
       contentPadding: const EdgeInsets.all(8),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
     onChanged: (String value) {
                            sex = value;
                          },
    ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30,left: 30),
                  child:TextField(
    cursorColor: Colors.red,
    style: TextStyle(color: Colors.black,fontSize: 18),
    decoration: InputDecoration(
      labelText: "Enter your blood group",
      labelStyle: TextStyle(color: Colors.black,fontSize: 18),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white,
       contentPadding: const EdgeInsets.all(8),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
     onChanged: (String value) {
                            bloodgroup = value.toUpperCase();
                          },
    ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30,left: 30),
                  child:TextField(
    cursorColor: Colors.red,
    style: TextStyle(color: Colors.black,fontSize: 18),
    decoration: InputDecoration(
      labelText: "Enter your mobile number",
      labelStyle: TextStyle(color: Colors.black,fontSize: 18),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white,
       contentPadding: const EdgeInsets.all(8),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
     onChanged: (String value) {
                            mobilenumber = value;
                            UID = FirebaseAuth.instance.currentUser!.uid;
                          },
    ),
                ),
                const SizedBox(
                  height: 20,
                ),
               
                 Container(
                       width: MediaQuery.of(context).size.width/2.2,
                       height: 45,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                           color: Colors.white ,
                           border:  Border.all(color: Color.fromARGB(209, 255, 255, 255),width: 2),
                          borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0)),
                           ),
                           child:
                      GestureDetector(
                        onTap:(){
                         
                        },
                        child: Center(
                        child: GestureDetector(
                          onTap: (){
                            createUser();
                            },
                          child: Text('Verify and Update',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red ,fontSize: 18),))),
                      ),
                                          )),                
   
                 
    
               ]) ]))));}
                 
     
  }
