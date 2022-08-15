import 'package:blood_donate/resources/auth_method.dart';
import 'package:blood_donate/widgets/text_field_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  bool _isloading =false;
 String _error = '';

 
  @override
  void dispose() {
    super.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _userNameTextController.dispose();
  }

  

void signupUser(){
    
                   
   FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text);
                          print("Created New Account");
                         Get.toNamed('/CreateProfile');
                         
}
  
 @override
  Widget build(BuildContext context) {
    return Material(
      color:Color.fromARGB(255, 245, 95, 85),
      child: SafeArea(
        child: SafeArea(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30),
              child: TextFieldInput(
                hintText: 'Enter your username',
                textEditingController: _userNameTextController,
                textInputType: TextInputType.text,
                isPass: false,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30),
              child: TextFieldInput(
                hintText: 'Enter your email',
                textEditingController: _emailTextController,
                textInputType: TextInputType.emailAddress,
                isPass: false,
              ),
            ),

              SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30),
              child: TextFieldInput(
                hintText: 'Enter your password',
                textEditingController: _passwordTextController,
                textInputType: TextInputType.text,
                isPass: true,
              ),
            ),
            
            SizedBox(
              height: 20,
            ),
            //button
             
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: GestureDetector(
                  onTap: signupUser,
                  child: Container(
                    height: 40,
                    width:MediaQuery.of(context).size.width/3,
                    child:_isloading ? Center(child: CircularProgressIndicator(color: Colors.red,),):Text(
                      'SIGN UP',
                      style: TextStyle(color: Color.fromARGB(200, 244, 67, 54),fontSize: 18),
                    ),
                  
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                  ),
                ),
              ),
            ),
         
           Center(child: Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Text(_error,style: TextStyle(color: Colors.white,fontSize: 16,),),
            )),
            // signInOption()
            
          ],
        )),
      ),
    );
  }
}

Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have account?",
            style: TextStyle(color:Colors.white,fontSize:18 )),
        GestureDetector(
          onTap: () {
            
          },
          child: const Text(
            "Login",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold,fontSize:18 ),
          ),
        )
      ],
    );
  }