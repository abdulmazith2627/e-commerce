import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/userapp/services/userpreferences/current_user.dart';
import 'package:my_app/utils/colors.dart';

class Shopcard extends StatefulWidget {
  const Shopcard({
    super.key,
    required this.image,
     required this.name,
     required this.price,
     required this.offer
     });
  final Uint8List image;
  final String name;
  final String price;
  final String offer;
  @override
  State<Shopcard> createState() => _ShopcardState();
}

class _ShopcardState extends State<Shopcard> {
  final getuserdata=Get.put(CurrentUser());

  @override
  Widget build(BuildContext context) {
    return Container(
      width:180,
      height:260,
      decoration: BoxDecoration(
        color:const Color.fromARGB(19, 158, 158, 158),
        borderRadius:BorderRadius.circular(10)
      ),
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width:150,
              height:150,
              decoration: BoxDecoration(
                image:DecorationImage(image:MemoryImage(widget.image))
              ),
            ),
            const SizedBox(height:10,),
           Align(
            alignment:Alignment.bottomLeft,
             child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
             Text(widget.name,maxLines:1,overflow: TextOverflow.ellipsis,),
                  Text(
              "Price : ${widget.price}",
            maxLines:1,
            overflow: TextOverflow.ellipsis,
            style:TextStyle(color:SAcolors.grey,fontSize:12),
            ),
                  Container(
              width:50,
              height:25,
              decoration: BoxDecoration(
                color:SAcolors.green,
                borderRadius:BorderRadius.circular(10)
              ),
              child:Align(
                alignment:Alignment.center,
                child:Text(widget.offer==''?"---":"${widget.offer}%",style:TextStyle(color:SAcolors.white,fontSize:Theme.of(context).textTheme.bodySmall?.fontSize),)),
            ),
            
              ],
             ),
           )

          ],
        ),
      ),
    );
  }
}
