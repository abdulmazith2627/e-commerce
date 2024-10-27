import 'dart:convert';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/admin_app/product/fecthproduct.dart';
import 'package:my_app/userapp/pages/tabpages/userproduct.dart';
import 'package:my_app/utils/colors.dart';
import 'package:my_app/utils/images.dart';
import 'package:my_app/widgets/global/shopcard.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final productdata=Get.put(Fecthproduct());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(
      leading:Container(
        width:50,
        height:50,
        decoration:BoxDecoration(
          image:DecorationImage(image:Theme.of(context).brightness==Brightness.light?const AssetImage(SAimage.logoimagelight):const AssetImage(SAimage.logoimagedark),
          fit:BoxFit.cover
          )
        ),
      ),
     
    ),
    body:Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future:productdata.getAllProductData(), 
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
             return const Center(child:CircularProgressIndicator(),);
          }
          else if(snapshot.hasData){
                  return SingleChildScrollView(
        child:Column(
          children: [
      
           CarouselSlider.builder(
            itemCount:SAimage.slider.length, 
            itemBuilder:(context,index,reallindex){
                return Container(
      
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(SAimage.slider[index]),
                               
                                )),
                      );
            },
             options: CarouselOptions(
              autoPlay:true,
              enlargeCenterPage:true
             )),
      
             Align(
                  alignment:Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Recommended for you ",style:Theme.of(context).textTheme.bodyMedium,),
                  )),
                  const SizedBox(height:30,),
                
                 GridView.builder(
                  physics:const NeverScrollableScrollPhysics() ,
                  itemCount:snapshot.data!.length,
                  shrinkWrap:true,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                    crossAxisSpacing:12,
                    mainAxisSpacing:12,
                    mainAxisExtent:250,
                    ),
                     itemBuilder:(context,index){
                      var product=snapshot.data![index];
                      Uint8List image=base64Decode(product["image"]);
                      return GestureDetector(
                        onTap:(){
                          Get.toNamed(
                            "/userproductpage",
                            arguments:{
                              'image':image,
                              'name':product["name"],
                              'price':product["price"],
                              'offer':product['offer'],
                              'decription':product['decription'],

                              'shirtcolor':product['shirtcolor'],
                              'size':product["size"],
                              'gender':product["gender"],
                              'delivery':product['delivery'],
                              'fabric':product['fabric'],
                              'sleeve':product['sleeve'],
                            }
                            );
                        },
                        child:Shopcard(image:image, name:product["name"], price:product["price"], offer:product['offer'],),
                      );
                     }),
                
      
                    
                  const SizedBox(height:50,),
          ],
        ),
      );
          }
          return const Center(child:Text("NO data is Found"),);
        }
        ),
    )
    );
  }
}
