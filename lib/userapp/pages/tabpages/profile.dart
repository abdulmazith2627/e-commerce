import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/admin_app/admin_services/admin_function/admin.dart';
import 'package:my_app/admin_app/admin_services/adminpreferences/adminpreferences.dart';
import 'package:my_app/admin_app/product/fecthproduct.dart';
import 'package:my_app/userapp/services/userpreferences/current_user.dart';
import 'package:my_app/widgets/global/listofaccount.dart';


class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
   final getdata=Get.put(CurrentUser());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("Account Settings"),),
      body:Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
           Text("Email : ${getdata.userdata.email}"),
          const SizedBox(height:20,),
           Text("username : ${getdata.userdata.username}")
          ],
        ),
      )
    );
  }
}
