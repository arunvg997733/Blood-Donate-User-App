import 'package:blooddonoruserapp/controller/authcontholler.dart';
import 'package:blooddonoruserapp/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  final ctrl = Get.put(Authcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: 
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(children: [
          kheight100,
          TextField(
            controller: ctrl.usernamectr,
              decoration: InputDecoration(
                label: Text('User Name'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  
                )
              ),
            ),
            kheight,
            TextField(
              controller: ctrl.emailctr,
              decoration: InputDecoration(
                label: Text('Gmail'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  
                )
              ),
            ),
            kheight,
            TextField(
              controller: ctrl.passwordctr,
              decoration: InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  
                )
              ),
            ),
            kheight,
          
            Obx(
              ()=> ElevatedButton(onPressed: () {
                ctrl.signUp();
              },child: ctrl.loading.value ?CircularProgressIndicator() : Text('Sign Up'),),
            )
          
        ],),
      ),
    )),);
  }
}