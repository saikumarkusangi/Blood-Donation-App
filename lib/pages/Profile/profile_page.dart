// import 'package:blood_donate/resources/auth_method.dart';
// import 'package:blood_donate/widgets/text_field_input.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class ProfilePage extends StatefulWidget {
 
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();


// }

// class _ProfilePageState extends State<ProfilePage> {
//   TextEditingController _age = TextEditingController();

//   TextEditingController _name = TextEditingController();

//   TextEditingController _sex = TextEditingController();

//   TextEditingController _mobilenumber = TextEditingController();

//   TextEditingController _bloodgroup = TextEditingController();

//   @override
//   void dispose() {
   
//     _age.dispose();
//     _name.dispose();
//     _sex.dispose();
//      _mobilenumber.dispose();
//       _bloodgroup.dispose();

//     List Profile = List.empty();
 
//   String name = "";

//   String age = "";

//   String sex = "";

//   String mobilenumber = "";

//   String bloodgroup = "";


//   createProfile() {
//     DocumentReference documentReference =
//         FirebaseFirestore.instance.collection("users").doc(name);
  
//   Map<String, String> Profile = {
//       "name": name,
//       "age":age,
//       "sex":sex,
//       "mobile number":mobilenumber,
//       "blood group":bloodgroup,
     

//     };
//     documentReference
//         .set(Profile)
//         .whenComplete(() => print("Data stored successfully"));
//   }

//   }

 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
     
//       backgroundColor: Color.fromARGB(255, 245, 95, 85),
//       body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
              
//               children: [
//                Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Padding(
//                         padding: const EdgeInsets.only(top:5.0,),
//                         child: Text('----- PROFILE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
//                       ),
//                       GestureDetector(
//                   child: Padding(
//                     padding: const EdgeInsets.only(right:10),
//                     child: Icon(Icons.logout,color: Colors.white,),
//                   ),
//                   onTap: (){
//                     FirebaseAuth.instance.signOut();
//              Get.toNamed('/welcome');
            
//                   },
//                 ),
               
//                    ],
//                  ),
//                  SizedBox(height: 40,),
//                         Container(
//                           width: 80,
//                           height: 80,
//                           decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(180),),
//                           child: Icon(Icons.person,color: Color.fromARGB(255, 245, 95, 85),size: 42,)),
                     
//                               SizedBox(
//                       height: 40,
//                     ),
//                        Padding(
//                       padding: const EdgeInsets.only(right: 30.0, left: 30),
//                       child: TextFieldInput(
//                         hintText: 'Enter your full name',
//                         textEditingController: _name,
//                         textInputType: TextInputType.text,
//                         isPass: false,
                        
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 30.0, left: 30),
//                       child: TextFieldInput(
//                         hintText: 'Enter your age',
//                         textEditingController: _age,
//                         textInputType: TextInputType.text,
//                         isPass: false,
//                       ),
//                     ),
//                      SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 30.0, left: 30),
//                       child: TextFieldInput(
//                         hintText: 'Enter your blood group',
//                         textEditingController: _bloodgroup,
//                         textInputType: TextInputType.text,
//                         isPass: false,
//                       ),
//                     ),
//                      SizedBox(height: 20,),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 30.0, left: 30),
//                       child: TextFieldInput(
//                         hintText: 'Enter your sex',
//                         textEditingController: _sex,
//                         textInputType: TextInputType.text,
//                         isPass: false,
//                       ),
//                     ),
//                      SizedBox(height: 20,),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 30.0, left: 30),
//                       child: TextFieldInput(
//                         hintText: 'Enter your mobile number',
//                         textEditingController: _mobilenumber,
//                         textInputType: TextInputType.text,
//                         isPass: false,
//                       ),
//                     ),
                    
                    
//                     SizedBox(height: 20,),
//                             Container(
//                                           width: MediaQuery.of(context).size.width/2.2,
//                                           height: 45,
//                                           child: DecoratedBox(
//                                             decoration: BoxDecoration(
//                                               color: Colors.white ,
//                                               border:  Border.all(color: Color.fromARGB(209, 255, 255, 255),width: 2),
//                                               borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(10.0),
//                           bottomRight: Radius.circular(10.0),
//                           topLeft: Radius.circular(10.0),
//                           bottomLeft: Radius.circular(10.0)),
//                            ),
//                            child:
//                       GestureDetector(
//                         onTap:(){
                         
//                         },
//                         child: Center(
//                         child: GestureDetector(
//                           onTap: (){createProfile();},
//                           child: Text('Verify and Update',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red ,fontSize: 18),))),
//                       ),
//                                           )),                
//                               ],
//                             ),
//           ),
                
                
              
//          ),
      
      
//       );
//   }
 
// }


// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);
 
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
  
//   @override
  
  
//   Widget build(BuildContext context) {
//     return
//      Scaffold(
//       backgroundColor: Color.fromARGB(255, 245, 95, 85),
//       body:  SafeArea(
//         child: SingleChildScrollView(
//             child: Column(
              
//               children: [
//                Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Padding(
//                         padding: const EdgeInsets.only(top:5.0,),
//                         child: Text('----- PROFILE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
//                       ),
//                       GestureDetector(
//                   child: Padding(
//                     padding: const EdgeInsets.only(right:10),
//                     child: Icon(Icons.logout,color: Colors.white,),
//                   ),
//                   onTap: (){
//                     FirebaseAuth.instance.signOut();
//              Get.toNamed('/welcome');
            
//                   },
//                 ),
               
//                    ],
//                  ),
                 
//        ] ),))); 
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
 
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  

  
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
  }
 final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 95, 85),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
      
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.white,),);
          }
          
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.only(right:0),
                child: Column(
                  children: [
                     if(FirebaseAuth.instance.currentUser!.uid == data['UID'])
                    Title(),
                    if(FirebaseAuth.instance.currentUser!.uid == data['UID'])
                    
                    Padding(
                      padding: const EdgeInsets.only(right: 30,left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white
          ),
                            height: 45,
                            child: Center(child:  Text(data['name'],style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),),),
                            SizedBox(height: 20,),
                            Container(
                            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white
          ),
                            height: 45,
                            child: Center(child:  Text(data['age'],style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),),),
                            SizedBox(height: 20,),
                            Container(
                            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white
          ),
                            height: 45,
                            child: Center(child:  Text(data['sex'],style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),),),
                            SizedBox(height: 20,),
                            Container(
                            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white
          ),
                            height: 45,
                            child: Center(child:  Text(data['blood group'],style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),),),
                            SizedBox(height: 20,),
                            Container(
                            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white
          ),
                            height: 45,
                            child: Center(child:  Text(data['mobile number'],style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),),),
                        ],
                      ),
                    )
                    
                  ],
                ),
              );
            }).toList(),
          );
        },
          ),
      ));}

  //     SafeArea(
  //       child: SingleChildScrollView(
  
  //           child: Column(
              
  //             children: [
  //              Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                  children: [
  //                    Padding(
  //                       padding: const EdgeInsets.only(top:5.0,),
  //                       child: Text('----- PROFILE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
  //                     ),
  //                     GestureDetector(
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(right:10),
  //                   child: Icon(Icons.logout,color: Colors.white,),
  //                 ),
  //                 onTap: (){
  //                   FirebaseAuth.instance.signOut();
  //            Get.toNamed('/welcome');
            
  //                 },
  //               ),
               
  //                  ],
  //                ),
   
  //         Column(
  //           children: [
  //             SizedBox(height: 40,),
  //                       Container(
  //                         width: 80,
  //                         height: 80,
  //                         decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(180),),
  //                         child: Icon(Icons.person,color: Color.fromARGB(255, 245, 95, 85),size: 42,)),
                     
  //                             SizedBox(
  //                     height: 40,
  //                   ),
  //             Padding(
  //                 padding: const EdgeInsets.only(right: 30,left: 30),
  //                 child:TextField(
  //   cursorColor: Colors.red,
  //   style: TextStyle(color: Colors.black,fontSize: 18),
  //   decoration: InputDecoration(
  //     labelText: "Enter your full name",
  //     labelStyle: TextStyle(color: Colors.black,fontSize: 18),
  //     filled: true,
  //     floatingLabelBehavior: FloatingLabelBehavior.never,
  //     fillColor: Colors.white,
  //      contentPadding: const EdgeInsets.all(8),
  //     border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5.0),
  //         borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  //   ),
  //    onChanged: (String value) {
  //                           name = value;
  //                         },
  //   ),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //           Padding(
  //                 padding: const EdgeInsets.only(right: 30,left: 30),
  //                 child:TextField(
  //   cursorColor: Colors.red,
  //   style: TextStyle(color: Colors.black,fontSize: 18),
  //   decoration: InputDecoration(
  //     labelText: "Enter your age",
  //     labelStyle: TextStyle(color: Colors.black,fontSize: 18),
  //     filled: true,
  //     floatingLabelBehavior: FloatingLabelBehavior.never,
  //     fillColor: Colors.white,
  //      contentPadding: const EdgeInsets.all(8),
  //     border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5.0),
  //         borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  //   ),
  //    onChanged: (String value) {
  //                           age = value;
   
  //                         },
  //   ),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //           Padding(
  //                 padding: const EdgeInsets.only(right: 30,left: 30),
  //                 child:TextField(
  //   cursorColor: Colors.red,
  //   style: TextStyle(color: Colors.black,fontSize: 18),
  //   decoration: InputDecoration(
  //     labelText: "Enter your gender",
  //     labelStyle: TextStyle(color: Colors.black,fontSize: 18),
  //     filled: true,
  //     floatingLabelBehavior: FloatingLabelBehavior.never,
  //     fillColor: Colors.white,
  //      contentPadding: const EdgeInsets.all(8),
  //     border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5.0),
  //         borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  //   ),
  //    onChanged: (String value) {
  //                           sex = value;
  //                         },
  //   ),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(right: 30,left: 30),
  //                 child:TextField(
  //   cursorColor: Colors.red,
  //   style: TextStyle(color: Colors.black,fontSize: 18),
  //   decoration: InputDecoration(
  //     labelText: "Enter your blood group",
  //     labelStyle: TextStyle(color: Colors.black,fontSize: 18),
  //     filled: true,
  //     floatingLabelBehavior: FloatingLabelBehavior.never,
  //     fillColor: Colors.white,
  //      contentPadding: const EdgeInsets.all(8),
  //     border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5.0),
  //         borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  //   ),
  //    onChanged: (String value) {
  //                           bloodgroup = value.toUpperCase();
  //                         },
  //   ),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(right: 30,left: 30),
  //                 child:TextField(
  //   cursorColor: Colors.red,
  //   style: TextStyle(color: Colors.black,fontSize: 18),
  //   decoration: InputDecoration(
  //     labelText: "Enter your mobile number",
  //     labelStyle: TextStyle(color: Colors.black,fontSize: 18),
  //     filled: true,
  //     floatingLabelBehavior: FloatingLabelBehavior.never,
  //     fillColor: Colors.white,
  //      contentPadding: const EdgeInsets.all(8),
  //     border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5.0),
  //         borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
  //   ),
  //    onChanged: (String value) {
  //                           mobilenumber = value;
  //                         },
  //   ),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
               
  //                Container(
  //                      width: MediaQuery.of(context).size.width/2.2,
  //                      height: 45,
  //                     child: DecoratedBox(
  //                       decoration: BoxDecoration(
  //                          color: Colors.white ,
  //                          border:  Border.all(color: Color.fromARGB(209, 255, 255, 255),width: 2),
  //                         borderRadius: BorderRadius.only(
  //                         topRight: Radius.circular(10.0),
  //                         bottomRight: Radius.circular(10.0),
  //                         topLeft: Radius.circular(10.0),
  //                         bottomLeft: Radius.circular(10.0)),
  //                          ),
  //                          child:
  //                     GestureDetector(
  //                       onTap:(){
                         
  //                       },
  //                       child: Center(
  //                       child: GestureDetector(
  //                         onTap: (){
  //                           createUser();
  //                           },
  //                         child: Text('Verify and Update',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red ,fontSize: 18),))),
  //                     ),
  //                                         )),                
   
                 
    
  //              ]) ]))));}
                 
     
  // }
}

Column Title(){
  return  Column(
    children: [
      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Padding(
                            padding: const EdgeInsets.only(top:5.0,),
                            child: Text('----- PROFILE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
                          ),
                          GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(right:10),
                        child: Icon(Icons.logout,color: Colors.white,),
                      ),
                      onTap: (){
                        FirebaseAuth.instance.signOut();
                 Get.toNamed('/welcome');
                
                      },
                    ),
                   
                       ],
                     ),
                       SizedBox(height: 40,),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(180),),
                          child: Icon(Icons.person,color: Color.fromARGB(255, 245, 95, 85),size: 42,)),
                     
                              SizedBox(
                      height: 40,
                    ),
    ],
  );
}