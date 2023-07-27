import 'package:blooddonoruserapp/Presentation/registerscreen.dart';
import 'package:blooddonoruserapp/controller/authcontholler.dart';
import 'package:blooddonoruserapp/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {

    
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(tabs: [
            Text('Login',style: textstyle),
            Text('Sign Up',style: textstyle),
            
          ]),
        ),
        body: TabBarView(
                    
                    children: [
                    Loginfield(),
                    RegisterScreen()
                  ])
        )
      
    );
  }
}

class Loginfield extends StatelessWidget {
   Loginfield({
    super.key,
  });

  final ctrl = Get.put(Authcontroller());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            kheight100,
            TextField(
              controller: ctrl.loginemailctr,
              decoration: InputDecoration(
                label: Text('User Name'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  
                )
              ),
            ),
            kheight,
            TextField(
              controller: ctrl.loginpasswordctr,
              decoration: InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  
                )
              ),
            ),
            kheight,
      
            ElevatedButton(onPressed: () {
              ctrl.signIn();
            }, child: Text('Login')),
      
            Row(
              children: [
                Expanded(child: Divider()),
                Text('OR'),
                Expanded(child: Divider()),
              ],
            )
          ],
        ),
      ),
    );
  }
}