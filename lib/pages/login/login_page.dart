import 'package:blood_donate/resources/auth_method.dart';
import 'package:blood_donate/widgets/text_field_input.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isloading =false;
 String _error = '';

 
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
  if(res == 'successfull'){
    
     setState(() {
    
  _isloading = false;
  print('successfull');
    Get.toNamed('/Dashboard');
                

  
  });
  }else{
    setState(() {
    
  _isloading = false;
  });
   print(res);
   setState(() {
     _error = res;
   });
  
  }
  
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
                hintText: 'Enter your email',
                textEditingController: _emailController,
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
                textEditingController: _passwordController,
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
                  onTap: loginUser,
                  child: Container(
                    height: 40,
                    width:MediaQuery.of(context).size.width/3,
                    child:_isloading ? Center(child: CircularProgressIndicator(color: Colors.red,),):Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.red,fontSize: 18),
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
            SizedBox(height: 68,),
            // signUpOption(), 
            
          ],
        )),
      ),
    );
  }
}

Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color:Colors.white,fontSize:18 )),
        GestureDetector(
          onTap: () {
            
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold,fontSize:18 ),
          ),
        )
      ],
    );
  }