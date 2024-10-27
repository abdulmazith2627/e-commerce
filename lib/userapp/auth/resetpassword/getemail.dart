import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/userapp/services/users_services/funcation/fetchdata.dart';
import 'package:my_app/utils/images.dart';
import 'package:my_app/utils/textdata.dart';
import 'package:my_app/widgets/global/textform.dart';


class Getemail extends StatefulWidget {
  const Getemail({super.key});

  @override
  State<Getemail> createState() => _GetemailState();
}

class _GetemailState extends State<Getemail> {
  final TextEditingController email = TextEditingController();
      final getuser=Get.put(Fetchdata());

   senduserdata(){
   }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Theme.of(context).brightness ==
                                      Brightness.light
                                  ? SAimage.logoimagelight
                                  : SAimage.logoimagedark))),
                    ),
                    Text(
                      SAText.titletext,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      SAText.sendemailforreset,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Textform(
                      hintText: SAText.emailtext,
                      prefixIcon: null,
                      suffixIcon: null,
                      controller: email,
                      obscureText: false,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (email.text.isNotEmpty) {
                        senduserdata();
                        Get.toNamed(
                          "/otp",
                         parameters:{
                          'email':email.text
                         }
                          );
                          email.clear();
                      }
                    },
                    child: const Text(SAText.sendemail)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
