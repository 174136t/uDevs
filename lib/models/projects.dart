//import 'package:flutter/material.dart';

class Project {
   int id;
   String projectname;
   String projectcategory;
   String projectdescription;
   String clientfirstname;
   String clientlastname;
   String payment;
 // final String period;
   String imagename;
   String createdAt;
   String member;
   int rating;
  Project(
      this.id,
      this.projectname,
      this.projectcategory,
      this.projectdescription,
      this.clientfirstname,
      this.clientlastname,
      this.payment,
      this.imagename,
      this.createdAt,
      this.member,
      this.rating
      );

      Project.fromMap(Map<String, dynamic> map) {
    this.id = map['project']["id"];
    this.projectname = map['project']["project_name"];
    this.projectcategory = map['project']["project_category"];
    this.projectdescription = map['project']["project_description"];
    // this.clientfirstname = map["user"]["first_name"];
    // this.clientlastname = ["user"]['last_name'];
    this.payment = map['project']["payment"];
    this.createdAt = map['project']["createdAt"];
  
  }
}
