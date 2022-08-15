import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



String lastdate =  DateFormat.yMMMd().format(DateTime.now());
String nextdate =  DateFormat.yMMMd().format(DateTime.now().add(Duration(days: 56)));




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 95, 85),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5,),
            Center(child: Text('BLOOD FOR LIFE',style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold),)),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
         
          ),

                height: MediaQuery.of(context).size.height/3.5,
                width: MediaQuery.of(context).size.width/1.2,
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 10,),
                    Image.asset('assets/images/poster.png',width: 100,),
                    Text('''Become a donar in few steps
            and save a life.''',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
            Text('''You can become a superhero too.''',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
          //   Container(
          //     width: 100,height: 30,
          //     decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(20),
          // color: Color.fromARGB(255, 245, 95, 85),
          // ),

          //   child: Center(child: GestureDetector(
          //     onTap: (){
          //       Get.toNamed('/recipient');              },
          //     child: Text('Click Here',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)))
          //       ),
                SizedBox(height: 10,),
                  ],
                ),
              ),
            ),

           Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('last Donation',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Next Eligibility',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  ),
                 
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('${lastdate}',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                   Text('${nextdate}',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                ],
              )
            ],
           ),

            Flexible(
              child: Container(
                decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
         
          ),

                height: MediaQuery.of(context).size.height/3.5,
                width: MediaQuery.of(context).size.width/1.2,
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 10,),
                   
                    Text('Precautions before donating Blood',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    Container(
              width: 100,height: 30,
              decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 245, 95, 85),
          ),
            child: Center(child: GestureDetector(
              onTap: (){Get.toNamed('/BeforeDonation');},
              child: Text('Click Here',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),

                ),
                
                      Text('Precautions after donating Blood',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
            Container(
              width: 100,height: 30,
              decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 245, 95, 85),
          ),
            child: Center(child: GestureDetector(
              onTap: (){
                Get.toNamed('/AfterDonation');
              },
              child: Text('Click Here',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)))
                ),
                SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ));
  }
}