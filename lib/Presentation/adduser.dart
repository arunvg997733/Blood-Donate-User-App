import 'package:blooddonoruserapp/Presentation/homescreen.dart';
import 'package:blooddonoruserapp/controller/authcontholler.dart';
import 'package:blooddonoruserapp/core/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
   AddScreen({super.key});

   FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController namectr = TextEditingController();
   TextEditingController mobilectr = TextEditingController();
   String? selectedbloodgroup;
   final bloodgroup = ['A+','A-','B+','B-','AB+','AB-','O+','O-'];
   final ctr = Get.put(Authcontroller());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: 
    AppBar( title: Text('Create profile'),
    ),
    body: Column(
        children: [
          auth.currentUser!.emailVerified ? SizedBox():Text('Not varified'),
          TextField(
              controller: namectr,
              textCapitalization: TextCapitalization.words,
              maxLength: 20,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                label: Text('Name')
              ),
            ),
            kheight,
            TextField(
              controller: mobilectr,
              maxLength: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                label: Text('Mobile Number')
              ),
            ),
            kheight,
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
              ),
              items:bloodgroup.map((e) => DropdownMenuItem(
                value: e, 
                child: Text(e)
                )).toList(),
              onChanged: (value) {
                selectedbloodgroup =value; 
              }),
              kheight,

              ElevatedButton(onPressed: () {
                ctr.adddonor(namectr.text, mobilectr.text, selectedbloodgroup!);
                Get.to(()=>HomeScreen());
              }, child: Text('Submit'))

        ],
      ),
    );
  }
}