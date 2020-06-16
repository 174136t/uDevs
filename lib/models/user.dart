//import 'package:flutter/material.dart';

class User {
  int id;
  String firstname;
  String lastname;
  String usertype;
  String email;
  String password;
  String gender;
  String contactno;
  int rating;
  String creat;
  String image;
  User( 
        this.id,
        this.firstname,
        this.lastname,
        this.usertype,
        this.email,
        this.password,
        this.gender,
        this.contactno,
        this.rating,
        this.creat,
        this.image,
      );

      // factory User.fromJson(Map<String, dynamic> json){
      // return User(  
      // id : json['id'] as int,
      // firstname : json['first_name'] as String,
      // lastname: json['last_name']as String ,
      // usertype: json['user_type']as String,
      // email: json['email']as String,
      // password: json['password']as String,
      // gender: json['gender']as String,
      // contactno: json['contact_no']as String,
      // ); 
      // }
      User.fromMap(Map<String, dynamic> map){
      this.id = map['id'];
      this.firstname = map['first_name'];
      this.lastname= map['last_name'];
      this.usertype= map['user_type'];
      this.email= map['email'];
      this.password= map['password'];
      this.gender= map['gender'];
      this.contactno= map['contact_no'];
      this.rating=map['rating'];
      this.creat=map['createdAt'];
      this.image=map['profile_img'];
      }

      // Map toJson(){
      //   return {
      //     'id': id,
      //     'first_name': firstname,
      //     'last_name' : lastname,
      //     'user_type' : usertype,
      //     'email' : email,
      //     'password' : password,
      //     'gender' : gender,
      //     'contact_no' : contactno
      //   };
      // }
}
