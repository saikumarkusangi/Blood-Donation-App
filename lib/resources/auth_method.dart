
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:blood_donate/resources/storage_methods.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:blood_donate/resources/model/user.dart' as model;

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future<model.User> getUserDetails() async{
   User currentUser = _auth.currentUser!;
   DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser.uid).get();
   String uid =currentUser.uid;
   return model.User.fromSnap(snap);
  }

 


  Future<String> signUpUser({
   required String email,
   required String password,
   required String username,
  

  })async{
     String res = 'Some error occured';
     try{
      if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty ){
        //register user
      UserCredential cred =   await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print(cred.user!.uid);

    
      //add user to database
     model.User user = model.User(
        username:username,
      uid:cred.user!.uid,
      email:email,
     
    
     );

     await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
      
      res = 'success';
      }
     }on FirebaseAuthException catch(err){
       if(err.code == 'invaild-email'){
         res = 'The email is badly formatted';
       }else if(err.code == 'weak-password'){
         res = 'password should be atleast 6 characters';
       }
     }
     
     catch(err){
       res = err.toString();
     }
     return res;
  }

Future<String> loginUser(
  {
    required String email,
    required String password,

  }
)async{
  String res = 'Invalid email';
  try{
  if(email.isNotEmpty && password.isNotEmpty){
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    res = 'successfull';
  }else if(email.isEmpty && password.isEmpty){
    res = 'please enter your email and password';
  }else if(password.isEmpty && email.isNotEmpty){
    res = 'please enter your password';
  }else if(email.isEmpty && password.isNotEmpty){
     res = 'please enter your email';
  }
  }on FirebaseAuthException catch(e){
    print(e);
    if (e.code == 'user-not-found') {
      res = "The email that you've entered doesn't belong to an account. Please check your email and try again.";
    }else if(e.code=='wrong-password'){
      res = 'Sorry, your password was incorrect. Please double-check your password.';
      
    }
  }
  catch(err){
   res = err.toString();
  }
  return res;

  
  
}
Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
  print('sign out');
  
}


}