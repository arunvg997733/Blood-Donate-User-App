import 'package:blooddonoruserapp/Presentation/loginscreen.dart';
import 'package:blooddonoruserapp/controller/authcontholler.dart';
import 'package:blooddonoruserapp/core/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   final CollectionReference donor = FirebaseFirestore.instance.collection('donor');
   FirebaseAuth auth = FirebaseAuth.instance;
   TextEditingController namectr = TextEditingController();
   TextEditingController mobilectr = TextEditingController();
   String? selectedbloodgroup;
   final bloodgroup = ['A+','A-','B+','B-','AB+','AB-','O+','O-'];
   final ctr = Get.put(Authcontroller());
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text('Home'),
        actions: [
          IconButton(onPressed: () async{
            await auth.signOut();
            Get.to(()=>LoginScreen());
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: !auth.currentUser!.emailVerified ? Center(child: Text('Not varified')): StreamBuilder(
        stream: donor.orderBy('name').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot data = snapshot.data.docs[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        )
                      
                    ]
                  ),
                  child: ListTile(
                    title: Text(data['name']),
                    leading:CircleAvatar(child: Text(data['group']),) ,
                    subtitle: Text(data['mobile'].toString()),
                    
                  )
                ),
              );
            },);
          }
          return Center(child: Text('No data'));
        },),
      // Column(
      //   children: [
      //     auth.currentUser!.emailVerified ? SizedBox():Text('Not varified'),
         

      //   ],
      // ),
    );
  }
}