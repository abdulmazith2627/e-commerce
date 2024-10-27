import 'package:flutter/material.dart';
import 'package:my_app/utils/colors.dart';


class Shopcart extends StatefulWidget {
  const Shopcart({super.key});

  @override
  State<Shopcart> createState() => _ShopcartState();
}

class _ShopcartState extends State<Shopcart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width:350,
        height:210,
        decoration:BoxDecoration(
          color:SAcolors.white,
          borderRadius:BorderRadius.circular(10),
          border:Border.all(color:SAcolors.grey,width:1),
          boxShadow:[
                    BoxShadow(
                      color:SAcolors.grey.withOpacity(0.5),
                      spreadRadius:5,
                      blurRadius:7,
                      offset:const Offset(0,3)
                    )
                   ]
        ),
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
            Row(
              children: [
                Container(
                  width:100,
                  height:100,
                  decoration:const BoxDecoration(
                    image:DecorationImage(image:AssetImage("assets/images/watch.jpg"))
                  ),
                ),
                const SizedBox(width:40,),
                Container(
                  width:50,
                  height:50,
                  decoration: BoxDecoration(

                    color:SAcolors.grey,
                    shape:BoxShape.circle
                  ),
                  child:const Icon(Icons.add),
                ),
               const SizedBox(width:20,),
                Text("1",style:Theme.of(context).textTheme.bodyLarge,),
                const SizedBox(width:20,),
                 Container(
                  width:50,
                  height:50,
                  decoration: BoxDecoration(

                    color:SAcolors.grey,
                    shape:BoxShape.circle
                  ),
                   child:const Icon(Icons.remove),
                ),
              ],
            ),
             Text("Product name",style:Theme.of(context).textTheme.bodyMedium,maxLines:1,overflow:TextOverflow.ellipsis,),
             Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                 Text("Price :  null",style:Theme.of(context).textTheme.bodyMedium,),

                 Container(
              width:80,
              height:35,
              decoration: BoxDecoration(
                color:SAcolors.green,
                borderRadius:BorderRadius.circular(10)
              ),
              child:Align(
                alignment:Alignment.center,
                child:Text("30%",style:TextStyle(color:SAcolors.white,fontSize:Theme.of(context).textTheme.bodySmall?.fontSize),)),
            ),
              ],
             )
            ],
          ),
        ),
      ),
    );
  }
}
