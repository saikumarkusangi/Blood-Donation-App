

import 'package:blood_donate/pages/login/login_page.dart';
import 'package:blood_donate/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool registerPress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 95, 85),
       body: SafeArea(
         child: Column(
           children: [
             Flexible(
              flex: 1,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 
                        
               Image.network(
                 'https://i.postimg.cc/zXprz981/logo2.png',
                 
                
               ),
             
                     
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    registerPress = false;
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width/2.5,
                                  height: 40,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: registerPress == false ? Colors.white : Color.fromARGB(255, 245, 95, 85),
                                      border: registerPress == false ?  Border.all(color: Colors.red) :Border.all(color: Color.fromARGB(209, 255, 255, 255),width: 2),
                                      borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
                   ),
                                      
                                    
                                    child: Center(
                                      child: Text('LOG IN',style: TextStyle(fontWeight: FontWeight.bold,color: registerPress == false? Colors.red : Color.fromARGB(255, 255, 255, 255),fontSize: 18),)),
                                  ),
                                  
                                ),
                              ),
                               GestureDetector(
                            onTap:  (){
                                setState(() {
                                    registerPress = true;
                                  });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/2.5,
                              height: 40,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color:registerPress == true ? Colors.white : Color.fromARGB(255, 245, 95, 85),
                                  border: registerPress == true ? Border.all(color: Colors.red ) : Border.all(color: Color.fromARGB(209, 255, 255, 255),width: 2) ,
                                  
                                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
                   ),
                                  
                                
                                child: Center(
                                  child: Text('REGISTER',style: TextStyle(fontWeight: FontWeight.bold,color: registerPress == true? Colors.red : Colors.white,fontSize: 18),)),
                              ),
                              
                            ),
                          )
                            ],
                          ),
                        
                 ],
               ),
             ),
             registerPress == true ? SignUpScreen() : LoginPage()
           ],
         ),
       )
    );
  }
}