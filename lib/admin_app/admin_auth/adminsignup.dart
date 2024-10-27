import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_app/admin_app/admin_services/admin_function/adminfecthdata.dart';
import 'package:my_app/utils/images.dart';
import 'package:my_app/utils/textdata.dart';
import 'package:my_app/widgets/global/snackbar.dart';
import 'package:my_app/widgets/global/textform.dart';

class Adminsignup extends StatefulWidget {
  const Adminsignup({super.key});

  @override
  State<Adminsignup> createState() => _AdminsignupState();
}

class _AdminsignupState extends State<Adminsignup> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final getdata=Get.put(Adminfecthdata());

     senddata(){
             getdata.signUp(
              email:_email.text,
               password:_password.text,
                username:_username.text
                );
      }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _username.dispose();
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                      SAText.adminsignuptitale,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 5,
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Textform(
                      hintText: SAText.usernametext,
                      prefixIcon: null,
                      suffixIcon: null,
                      controller: _username,
                      obscureText: false,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_email.text.isNotEmpty&&
                      _password.text.isNotEmpty&&
                      _username.text.isNotEmpty) {
                          if(_email.text.isEmail==true){
                              
                                senddata();
                                  _email.clear();
                          _password.clear();
                          _username.clear();
                             
                          }
                          else{
                            snack(title: 'Error',message:'invalid email');
                          }
                          
                      }
                      else{
                      snack(title: 'Error',message:'Enter your deatils ');
                      }
                    },
                    child: const Text(SAText.signupbuttontext)),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(SAText.alreadylogin),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(SAText.loginbuttontext)),
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
