import 'package:blood_donate/widgets/text_field_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
class BloodRecipient extends StatefulWidget {
  const BloodRecipient({Key? key}) : super(key: key);

  @override
  State<BloodRecipient> createState() => _BloodRecipientState();
}

class _BloodRecipientState extends State<BloodRecipient> {
  TextEditingController controller = new TextEditingController();
    String name = "";
    bool pressed =false;

String lastdate =  '';
String nextdate =  '';

  @override
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 95, 85),
      body: SafeArea(
        child: Column(
          children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: const EdgeInsets.only(top:5.0),
              child: Text('----- BLOOD RECIPIENT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:45.0),
              child: Text('PEOPLE WHO NEED BLOOD',style: TextStyle(color: Colors.white,fontSize: 12),),
            ),
           SizedBox(height: 10,),
              Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: controller,
                       onChanged: (val) {
              setState(() {
                name = val;
              });
            },
                    decoration: new InputDecoration(
                        hintText: 'Search by blood group..', border: InputBorder.none),
                   // onChanged: onSearchTextChanged,
                  ),
                  trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                    controller.clear();
                   // onSearchTextChanged('');
                  },),
                ),),
          
          
        
          ]
        ),
            
          ],
        ),

        StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('requests').snapshots(),
              builder: (context, snapshots) {
                
                
                return (snapshots.connectionState == ConnectionState.waiting)
                    ? Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Center(
                          child: CircularProgressIndicator(color: Colors.white,),
                        ),
                    )
                    : 
                        Expanded(
                          child: ListView.builder(
                              itemCount: snapshots.data!.docs.length,
                              itemBuilder: (context, index) {
                             
                                var data = snapshots.data!.docs[index].data()
                                    as Map<String, dynamic>;
                                  
                                   if(snapshots.data!.docs.isEmpty){
                                return Center(child: Padding(
                                  padding: const EdgeInsets.only(top:200.0),
                                  child: Text('EMPTY',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                                ),);
                                }
                                if (name.isEmpty ) {
                                 print(data['mobile number']);
                                  return Column(
                                    children: [
                                      
                                      SizedBox(height: 10,),
                                       if(FirebaseAuth.instance.currentUser!.uid != data['UID'])
                                      ListTile(
                                        title: Text(
                                          data['name'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 2,),
                                            Text(
                                              data['units'] + ' Units',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'mobile : '+data['mobile number'] ,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                             
                                              width: MediaQuery.of(context).size.width/2,
                                              child: Text(data['address'],style: TextStyle(color: Colors.white,fontSize: 14),)),
                                          ],
                                        ),
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Center(child: Text(data['blood group'],style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                                        ),
                                        trailing: Container(
                                              width: MediaQuery.of(context).size.width/6,
                                              height: 30,
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
                          onTap: (){ setState(() {
                            pressed = true;
                          });
                          setState(() {
                            lastdate = DateFormat.yMMMd().format(DateTime.now());
                            nextdate = DateFormat.yMMMd().format(DateTime.now().add(Duration(days: 56)));
                          });
                          if (pressed == true){
                            FlutterPhoneDirectCaller.callNumber(data['mobile number']);
                          }},
                          child: 
                          Text(pressed == false ? 'Donate': 'Call',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red ,fontSize: 14),))),
                      ),
                                              )),
                                      ),
                                    ],
                                  );
                                }
                               
                                if (data['blood group']
                                    .toString()
                                    .toUpperCase()
                                    .startsWith(name.toUpperCase())) {
                                  return ListTile(
                                    title: Text(
                                      data['name'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 2,),
                                        Text(
                                          data['units'] + ' Units',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                         
                                          width: MediaQuery.of(context).size.width/2,
                                          child: Text(data['address'],style: TextStyle(color: Colors.white,fontSize: 14),)),
                                      ],
                                    ),
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Center(child: Text(data['blood group'],style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                                    ),
                                      trailing: Container(
                                          width: MediaQuery.of(context).size.width/6,
                                          height: 30,
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
                        child: Text('Donate',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red ,fontSize: 14),)),
                      ),
                                          )),
                                  );
                                }
                                return Container();
                              }),
                        );
                      }),
        
   ] )));
    
  }
}
//  SingleChildScrollView(
//              child: 
          //      StreamBuilder<QuerySnapshot>(
          // stream: FirebaseFirestore.instance.collection('users').snapshots(),
          // builder: (context, snapshots) {
          //   return (snapshots.connectionState == ConnectionState.waiting)
          //       ? Center(
          //           child: CircularProgressIndicator(),
          //         )
          //       : ListView.builder(
          //           itemCount: snapshots.data!.docs.length,
          //           itemBuilder: (context, index) {
          //             var data = snapshots.data!.docs[index].data()
          //                 as Map<String, dynamic>;

          //             if (name.isEmpty) {
          //               return ListTile(
          //                 title: Text(
          //                   data['name'],
          //                   maxLines: 1,
          //                   overflow: TextOverflow.ellipsis,
          //                   style: TextStyle(
          //                       color: Colors.black54,
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //                 subtitle: Text(
          //                   data['email'],
          //                   maxLines: 1,
          //                   overflow: TextOverflow.ellipsis,
          //                   style: TextStyle(
          //                       color: Colors.black54,
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //                 leading: CircleAvatar(
          //                   backgroundImage: NetworkImage(data['image']),
          //                 ),
          //               );
          //             }
          //             if (data['name']
          //                 .toString()
          //                 .toLowerCase()
          //                 .startsWith(name.toLowerCase())) {
          //               return ListTile(
          //                 title: Text(
          //                   data['name'],
          //                   maxLines: 1,
          //                   overflow: TextOverflow.ellipsis,
          //                   style: TextStyle(
          //                       color: Colors.black54,
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //                 subtitle: Text(
          //                   data['email'],
          //                   maxLines: 1,
          //                   overflow: TextOverflow.ellipsis,
          //                   style: TextStyle(
          //                       color: Colors.black54,
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //                 leading: CircleAvatar(
          //                   backgroundImage: NetworkImage(data['image']),
          //                 ),
          //               );
          //             }
          //             return Container();
          //           });})
            
             