import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/admin_app/admin_auth/admin_forgotpassword/adminotp.dart';
import 'package:my_app/admin_app/admin_auth/admin_forgotpassword/adminresetpassword.dart';
import 'package:my_app/admin_app/admin_auth/admin_forgotpassword/adminsendemail.dart';
import 'package:my_app/admin_app/admin_auth/adminlogin.dart';
import 'package:my_app/admin_app/admin_auth/adminsignup.dart';
import 'package:my_app/admin_app/admin_pages/addproduct.dart';
import 'package:my_app/admin_app/admin_pages/admin_homepage.dart';
import 'package:my_app/userapp/pages/tabpages/userproduct.dart';
import 'package:my_app/userapp/services/userpreferences/userpreferences.dart';
import 'package:my_app/userapp/services/users_services/funcation/users.dart';
import 'package:my_app/userapp/pages/home.dart';
import 'package:my_app/app_theme/settings/themes/themes.dart';
import 'package:my_app/userapp/auth/login.dart';
import 'package:my_app/userapp/auth/onboardpages/onboard.dart';
import 'package:my_app/userapp/auth/resetpassword/getemail.dart';
import 'package:my_app/userapp/auth/resetpassword/otp.dart';
import 'package:my_app/userapp/auth/resetpassword/resetpass.dart';
import 'package:my_app/userapp/auth/signup.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title:'Shop All',
      debugShowCheckedModeBanner:false,
      themeMode:ThemeMode.system,
      theme:SAThemes.lightmode,
      darkTheme: SAThemes.darkmode,
      home:FutureBuilder(
        future:UsersPreferences.getuserdata(), 
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          else if(snapshot.hasData){
            return const Bar();
          }
          
          return const Onboard();
        }
        
        ),



      getPages: [
        GetPage(name:"/loginpage", page:(()=> const Loginpage())),
        GetPage(name:"/signup", page:(()=> const Signup())),
        GetPage(name:"/resetpassword", page:(()=> const Getemail())),
        GetPage(name:"/otp", page:(()=> const Otp())),
        GetPage(name:"/password", page:(()=> const Resetpass())),
        GetPage(name:"/bar", page:(()=> const Bar())),
          GetPage(name:"/userproductpage", page:(()=> const Userproduct())),
        
        // admin page
        GetPage(name:"/adminlogin", page:(()=> const Adminlogin())),
        GetPage(name:"/adminsignup", page:(()=> const Adminsignup())),
        GetPage(name:"/adminresetpassword", page:(()=> const Adminsendemail())),
        GetPage(name:"/adminotp", page:(()=> const  Adminotp())),
        GetPage(name:"/adminnewpassword", page:(()=> const Adminresetpassword() )),
        GetPage(name:"/adminhomepage", page:(()=> const AdminHomepage() )),
         GetPage(name:"/publishproduct", page:(()=> const Addproduct() )),
       
      ],
    );
  }
}
