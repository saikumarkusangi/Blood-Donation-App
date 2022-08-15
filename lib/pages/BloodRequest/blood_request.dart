import 'package:blood_donate/pages/Dashboard/dashboard.dart';
import 'package:blood_donate/widgets/text_field_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
class BloodRequest extends StatefulWidget {
  const BloodRequest({Key? key}) : super(key: key);

  @override
  State<BloodRequest> createState() => _BloodRequestState();
}

class _BloodRequestState extends State<BloodRequest> {
final Cname  = TextEditingController();
final Cunits  = TextEditingController();
final Cbloodgroup  = TextEditingController();
final Caddress  = TextEditingController();
final Cmobilenumber  = TextEditingController();
String nowdate =  DateFormat.yMMMd().format(DateTime.now());
  void clearText(){
  Cname.clear();
   Cunits.clear();
    Caddress.clear();
     Cbloodgroup.clear();
      Cmobilenumber.clear();
  }
  List requests= List.empty();
 String name = "";

  String mobilenumber = "";

  String bloodgroup = "";

  String UID = '';
  
  String address = '';

  String units = '';

  String date = '';

    createRequest() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("requests").doc(name);
  
  Map<String, String> RequestList= {
     "name": name,
      "mobile number":mobilenumber,
      "blood group":bloodgroup,
      'UID':UID,
      'address' : address,
      'units' : units,
      'date' : date,

    }; 
    documentReference
        .set(RequestList)
        .whenComplete(() => print("request sended successfully"));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Request sended')));
        clearText();
        
  }
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 95, 85),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Padding(
                padding: const EdgeInsets.only(top:5.0),
                child: Text('----- BLOOD REQUEST',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
              ),
              Padding(
                padding: const EdgeInsets.only(left:45.0),
                child: Text(' ASK PEOPLE TO DONATES BLOOD',style: TextStyle(color: Colors.white,fontSize: 12),),
              ),
             SizedBox(height: 10,),
            
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.history,color: Colors.white,),
                GestureDetector(
                  onTap:(){
                    Get.toNamed('/history');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('History',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                )
              ],
             ),
             SizedBox(height: 50,),
             Column(
              children: [
                  SizedBox(height: 20,),
                          
                        
                Padding(
                    padding: const EdgeInsets.only(right: 30,left: 30),
                    child:TextField(
            cursorColor: Colors.red,
            controller: Cname,
            style: TextStyle(color: Colors.black,fontSize: 18),
            decoration: InputDecoration(
              labelText: "Enter full name",
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
             controller: Cbloodgroup,
            style: TextStyle(color: Colors.black,fontSize: 18),
            decoration: InputDecoration(
              labelText: "Enter required blood group",
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
             controller: Cunits,
            style: TextStyle(color: Colors.black,fontSize: 18),
            decoration: InputDecoration(
              labelText: "Enter no.of units required",
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
                              units = value;
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
             controller: Caddress,
            style: TextStyle(color: Colors.black,fontSize: 18),
            decoration: InputDecoration(
              labelText: "Enter hospital address",
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
                              address = value.toUpperCase();
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
             controller: Cmobilenumber,
            style: TextStyle(color: Colors.black,fontSize: 18),
            decoration: InputDecoration(
              labelText: "Enter  mobile number",
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
                              date = nowdate;
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
                              createRequest();
                              },
                            child: Text('Request',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red ,fontSize: 18),))),
                        ),
                                            )),                
                 ])       
              ],
             ),
        )
          
        ),
      );
    
    
  }
}
