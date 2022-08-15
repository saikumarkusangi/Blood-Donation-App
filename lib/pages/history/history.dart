


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('requests').snapshots();

bool pressed =false;

void Delete() {

  setState(() {
    pressed = true;
  });
  

}

DeleteDialog(){
  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 245, 95, 85),
        elevation: 0,
        title: Text('HISTORY',style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Color.fromARGB(255, 245, 95, 85),
      body:  StreamBuilder<QuerySnapshot>(
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
             
             
                return Column(
                  children: [
                    if(FirebaseAuth.instance.currentUser!.uid == data['UID'])
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Center(child: Text(data['blood group'],style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                              ),
                    title: Text(data['date'],style: TextStyle(color: Colors.white),),
                     trailing: GestureDetector(
                              onTap:(){
                               Get.defaultDialog(
    title: 'Delete Request',
    titleStyle: TextStyle(fontSize:20),
    middleText: 'Are you sure to delete request?',
    textCancel: 'Cancel',
    textConfirm: 'Confirm',
    confirmTextColor: Colors.white,
    buttonColor: Colors.red,
    cancelTextColor: Colors.red,
    onCancel: (){},
    onConfirm: (){
       FirebaseFirestore.instance.collection('requests').doc(document.id) .delete();
       Get.back();
    }
  );
                               
                                 
                              } ,
                              child: Icon(Icons.delete,color: Colors.white,))
                          
                    ),
                  ],
                );
              }).toList(),
            );
          
        
      },
    )
    );
}}

