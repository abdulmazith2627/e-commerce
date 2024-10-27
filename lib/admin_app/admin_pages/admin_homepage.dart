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

/**
 Scaffold(
      appBar: AppBar(
                          title: const Text("Admin"),
                          centerTitle: true,
                          actions: [
                            IconButton(
                                onPressed: () {
                                  Get.toNamed("/publishproduct");
                                },
                                icon: const Icon(Icons.add))
                          ],
                        ),
      body: Center(
        child:ElevatedButton(onPressed:(){
           getadminproductdata();
        }, child:const Text("getdata")),
      )
    );


 class AdminHomepage extends StatefulWidget {
  const AdminHomepage({super.key});

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  final getuserdata = Get.put(CurrentAdmin());
  final adminproductdata = Get.put(Fecthproduct());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrentAdmin>(
      init: getuserdata,
      initState: (currentstate) {
        getuserdata.getuserdata();  // Fetch user data on widget build
      },
      builder: (controller) {
        return FutureBuilder(
          future: AdminPreferences.getuserdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return FutureBuilder<List<Product>>(
                future: adminproductdata.getcurrentadmin(adminid: getuserdata.userdata.id),
                builder: (context, productSnapshot) {
                  if (productSnapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (productSnapshot.hasData) {
                    var products = productSnapshot.data!;
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text("Admin"),
                        centerTitle: true,
                        actions: [
                          IconButton(
                              onPressed: () {
                                Get.toNamed("/publishproduct");
                              },
                              icon: const Icon(Icons.add))
                        ],
                      ),
                      body: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          var product = products[index];
                          return ListTile(
                            leading: product.image.isNotEmpty
                                ? Image.network(
                                    product.image,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.image),
                            title: Text(product.productname),
                            subtitle: Text(product.productprice),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: Text('No Products Found'));
                  }
                },
              );
            }
            return const Onboard();
          },
        );
      },
    );
  }
}





FutureBuilder<List<Product>>(
                future: adminproductdata.fetchProducts(adminId: getuserdata.userdata.id),
                builder: (context, productSnapshot) { 
                  if (productSnapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (productSnapshot.hasData) {
                    var products = productSnapshot.data!;
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text("Admin"),
                        centerTitle: true,
                        actions: [
                          IconButton(
                              onPressed: () {
                                Get.toNamed("/publishproduct");
                              },
                              icon: const Icon(Icons.add))
                        ],
                      ),
                      body: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          var product = products[index];
                          bool isBase64Image = product.image.startsWith('data:image');
                          return  Padding(
                            padding:const EdgeInsets.all(20.0),
                            child: Adminlistproduct(image:null, productname:product.productname,price:product.productprice,),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: Text('No Products Found'));
                  }
                },
              );

 */