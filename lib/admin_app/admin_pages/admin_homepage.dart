import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_app/admin_app/admin_services/adminpreferences/adminpreferences.dart';
import 'package:my_app/admin_app/admin_services/adminpreferences/current_admin.dart';
import 'package:my_app/admin_app/product/fecthproduct.dart';
import 'package:my_app/admin_app/product/product.dart';
import 'package:my_app/userapp/auth/onboardpages/onboard.dart';
import 'package:my_app/userapp/services/userpreferences/current_user.dart';
import 'package:my_app/widgets/global/adminlistproduct.dart';

class AdminHomepage extends StatefulWidget {
  const AdminHomepage({super.key});

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  final getuserdata = Get.put(CurrentAdmin());
  final adminproductdata = Get.put(Fecthproduct());

  getadminproductdata() {

        adminproductdata.getProductdata(id:getuserdata.userdata.id);
  }
 

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CurrentAdmin>(
      init: getuserdata,
      initState: (currentstate) {
        getuserdata.getuserdata(); 
        
        adminproductdata.getProductdata(id:getuserdata.userdata.id); // Fetch user data on widget build
      },
      builder: (controller) {
        return FutureBuilder(
          future: AdminPreferences.getuserdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return  Scaffold(
      appBar: AppBar(
        title: Text("Products"),
          actions: [
                            IconButton(
                                onPressed: () {
                                  Get.toNamed("/publishproduct");
                                },
                                icon: const Icon(Icons.add))
                          ],
        ),
      body: Obx(
        (){
          return FutureBuilder(
        future: adminproductdata.getProductdata(id:getuserdata.userdata.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Products Found'));
          } else {
            // Display product data with image
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Product product = snapshot.data![index];
                return ListTile(
                  onTap:(){
                   
                  },
                  title: Text(product.name),
                  subtitle: Text(product.decription),
                  leading: Image.memory(product.image), // Display the image
                );
              },
            );
          }
        },
      );
        }
      ),
    );
            }
            return const Onboard();
          },
        );
      },
    );
  }
}

