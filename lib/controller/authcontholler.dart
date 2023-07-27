import 'package:blooddonoruserapp/Presentation/adduser.dart';
import 'package:blooddonoruserapp/Presentation/homescreen.dart';
import 'package:blooddonoruserapp/Presentation/loginscreen.dart';
import 'package:blooddonoruserapp/model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController{
 
  
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController usernamectr = TextEditingController();
  TextEditingController emailctr = TextEditingController();
  TextEditingController passwordctr = TextEditingController();
  TextEditingController loginemailctr = TextEditingController();
  TextEditingController loginpasswordctr = TextEditingController();
  var loading = false.obs;

 



  signUp()async{
    try {
      loading.value = true;
      await auth.createUserWithEmailAndPassword(email: emailctr.text, password: passwordctr.text);
      addUsere();
      await verifyEmail();
      Get.to(()=>AddScreen());
      loading.value = false;
      
    } catch (e) {
      Get.snackbar(overlayColor: Colors.amber,'Error', '$e');
      loading.value = false;
    }
  }

  addUsere()async{
    usermodel user = usermodel(username: usernamectr.text, email: auth.currentUser?.email);
    await db.collection('users').doc(auth.currentUser?.uid).collection('profile').add(user.toMap());
  }

  signOut()async{
    await auth.signOut();
  }

  signIn()async{
    try {
      await auth.signInWithEmailAndPassword(email: loginemailctr.text, password: loginpasswordctr.text);
      Get.to(()=>HomeScreen());
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }

  verifyEmail()async{
    await auth.currentUser?.sendEmailVerification();
    Get.snackbar('email', 'Send');
    
  }

  adddonor(String name,String number,String group){
  final CollectionReference donor = FirebaseFirestore.instance.collection('donor');

  final data = {
    'name':name,
    'mobile':number,
    'group':group
  };
  donor.add(data);

}


}