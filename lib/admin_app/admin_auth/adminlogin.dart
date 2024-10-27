import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/admin_app/admin_services/admin_function/adminfecthdata.dart';
import 'package:my_app/utils/images.dart';
import 'package:my_app/utils/textdata.dart';
import 'package:my_app/widgets/global/snackbar.dart';
import 'package:my_app/widgets/global/textform.dart';
class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
   final getdata=Get.put(Adminfecthdata());

     senddata(){
             getdata.login(
              email:_email.text,
               password:_password.text,
              
                );
      }
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
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
                      SAText.adminlogintitale,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Textform(
                      hintText: SAText.emailtext,
                      prefixIcon: null,
                      suffixIcon: null,
                      controller: _email,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Textform(
                      hintText: SAText.passwordtext,
                      prefixIcon: null,
                      suffixIcon: null,
                      controller: _password,
                      obscureText: true,
                    )
                  ],
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          Get.toNamed("/adminresetpassword");
                        },
                        child: const Text(SAText.forgotbuttontext))),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                       if (_email.text.isNotEmpty&&
                      _password.text.isNotEmpty) {
                          if(_email.text.isEmail==true){
                              
                                senddata();
                          _email.clear();
                          _password.clear();
                         
                             
                          }
                          else{
                            snack(title: 'Error',message:'invalid email');
                          }
                          
                      }
                      else{
                      snack(title: 'Error',message:'Enter your deatils ');
                      }
                    },
                    child: const Text(SAText.loginbuttontext)),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(SAText.newsignup),
                    TextButton(
                        onPressed: () {
                          Get.toNamed("/adminsignup");
                        },
                        child: const Text(SAText.signupbuttontext)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
