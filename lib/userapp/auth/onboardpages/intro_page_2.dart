import 'package:flutter/material.dart';
import 'package:my_app/utils/colors.dart';
import 'package:my_app/utils/images.dart';


class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           Image(
            image:const AssetImage(SAimage.onboard2),
            width:MediaQuery.of(context).size.width,
            height:400,
            ),
              const SizedBox(height:20,),
            Align(
              alignment:Alignment.center,
              child: Column(
                children: [
                  Text(
                "Introduction of shopAll",
                style:Theme.of(context).textTheme.titleSmall,
                textAlign:TextAlign.center,
                ),
                const SizedBox(height:20,),
                  Text(
                "buying  and  selling anythings on shopall platform is very useful",
                style:TextStyle(color:SAcolors.grey,fontSize:Theme.of(context).textTheme.bodySmall?.fontSize),
                textAlign:TextAlign.center,
                ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}