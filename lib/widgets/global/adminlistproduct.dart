
import 'package:flutter/material.dart';

class Adminlistproduct extends StatelessWidget {
  const Adminlistproduct({super.key, required this.image, required this.productname,required this.price});
  final dynamic image;
 final String productname;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width:350,
        height:150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow:[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ]
        ),
        child:Column(
          children: [
            Row(
              children: [
                Container(
                  width:100,
                  height:130,
                  decoration: BoxDecoration(
                    image:image!=null?DecorationImage(image:MemoryImage(image)):const DecorationImage(image:AssetImage("assets/images/watch.jpg"))
                  ),
                ),
                  
             Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                   Text(productname),
                   Text(price),
                   
                ],
              ),
          
            const  SizedBox(width:40,),
              IconButton(onPressed:(){}, icon:const Icon(Icons.remove_circle_sharp,size:40,color:Colors.red,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
