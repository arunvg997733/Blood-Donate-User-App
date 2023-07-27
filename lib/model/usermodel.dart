import 'package:cloud_firestore/cloud_firestore.dart';

class usermodel{
  String username;
  String? email;
  String? id;
  usermodel({required this.username,required this.email,this.id});
  factory usermodel.fromMap(DocumentSnapshot map){
    return usermodel(username: map['username'], email: map['gmail'],id: map.id);
  }

  Map<String,dynamic> toMap(){
    return {
      'username':username,
      'gmai':email
    };
  }
}