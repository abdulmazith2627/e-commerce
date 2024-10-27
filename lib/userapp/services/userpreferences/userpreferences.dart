

import 'dart:convert';

import 'package:my_app/userapp/services/users_services/funcation/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersPreferences{

static Future<void> saveuserdata(userinfo)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var userJsondata = jsonEncode(userinfo);
    print(" pref: ${userJsondata}");
    await preferences.setString("currentUser",userJsondata);
}

static Future<Users?> getuserdata()async{
  Users? data;
   SharedPreferences preferences=await SharedPreferences.getInstance();
   var getdata=preferences.getString("currentUser");
   if(getdata!=null){
  print("Recived data : ${getdata.toString()}");
   data =Users.fromJson(jsonDecode(getdata));
   print("email:${data.email.toString()}");
   print("username:${data.username.toString()}");
    
   }
  return data;

}
} 