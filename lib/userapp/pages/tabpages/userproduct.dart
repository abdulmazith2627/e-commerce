import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/userapp/services/userpreferences/current_user.dart';
import 'package:my_app/utils/colors.dart';
import 'package:my_app/widgets/global/snackbar.dart';
import 'package:razorpay_web/razorpay_web.dart';

class Userproduct extends StatefulWidget {
  const Userproduct({super.key});

  @override
  State<Userproduct> createState() => _UserproductState();
}

class _UserproductState extends State<Userproduct> {
  
  final Uint8List? image = Get.arguments?['image'];

    final String name = Get.arguments?['name'] ?? "product name";

    final String price = Get.arguments?['price']??"price";

    final String decription = Get.arguments?['decription']??"decription";

    final String offer = Get.arguments?['offer']??"---";

  final  String dresscolor = Get.arguments?['shirtcolor']?? "shirtcolor";

    final String size = Get.arguments?['size'] ?? "size";

    final String gender = Get.arguments?['gender']??"gender";

    final String delivery = Get.arguments?['delivery']??"delivery";

    

    final String fabric = Get.arguments?['fabric']??"fabric";
    final String sleeve = Get.arguments?['sleeve']??"sleeve";
   final getdata=Get.put(CurrentUser());
   late Razorpay _razorpay;

     @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  
    @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }
 void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': "${price}00",
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': getdata.userdata.email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

 void _handlePaymentSuccess(PaymentSuccessResponse response) {
   
    snack(title:"Success", message: response.paymentId!);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
     snack(title:"Error", message: response.message!);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    snack(title:"Something error !", message: response.walletName!);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("Product details",style:TextStyle(fontSize:20),),),
      bottomNavigationBar:Container(
        width:MediaQuery.of(context).size.width,
        height:70,
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
          Text(name),
           const SizedBox(width:10,),

             GestureDetector(
              onTap:(){
                Get.defaultDialog(
                  title:"select",
                  content:Column(
                    children: [
                      ElevatedButton(
                        onPressed:(){
                          Get.back();
                        snack(title:"Your order", message: "sucessfully");
                       
                      }, child: const Text("Cash on delivery")),

                      const SizedBox(height:20,),
                      ElevatedButton(
                        onPressed:(){
                         
                      openCheckout();
                       
                      }, child: const Text("online payment")),
                     
                    ],
                  )
                );


              },
               child: Container(
                width:150,
                height:50,
                decoration:BoxDecoration(
                  border:Border.all(width:1,color:Colors.black),
                  borderRadius:BorderRadius.circular(10),
                ),
                child:const Center(child:Text("Buy now",style:TextStyle(color:Colors.black),),),
                           ),
             ),
          ],
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width:MediaQuery.of(context).size.width,
              height:300,
              decoration:BoxDecoration(
                image:DecorationImage(
                  image:image!=null?MemoryImage(image!):const AssetImage("assets/images/watch.jpg"),
                  fit:BoxFit.scaleDown
                  ),
            
              ),
            ),
            const Divider(),

            Align(
              alignment:Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                Text(decription,style:Theme.of(context).textTheme.labelSmall,),
                    const SizedBox(height:6,),
      
                           Row(
                            children: [
                        Text("Price : $price",style:Theme.of(context).textTheme.bodyMedium,),
                        const SizedBox(width:30,),
                        Container(
              width:50,
              height:25,
              decoration: BoxDecoration(
                color:SAcolors.green,
                borderRadius:BorderRadius.circular(10)
              ),
              
              child:Align(
                alignment:Alignment.center,
                child:Text("${offer.toString()}%",style:TextStyle(color:SAcolors.white,fontSize:Theme.of(context).textTheme.bodySmall?.fontSize),)),
            ),
                            ]
                           ),        


                           
                  ],
                ),
              ),
            ),
               const  SizedBox(height:20,),
            Text("Product details",style:Theme.of(context).textTheme.bodySmall,),
           const SizedBox(height:30,),

        Align(
          alignment:Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                  Text("Dress Color : $dresscolor"),
                const SizedBox(height:20,),
                Text("Dress Size : $size"),
                const SizedBox(height:20,),
                Text("delivery Fees : $delivery"),
                const SizedBox(height:20,),
                Text("fabric : $fabric"),
                const SizedBox(height:20,),
                Text("sleeve : $sleeve"),
              ],
            ),
          ),
        )
          ],
        ),
      ),
    );
  }
}