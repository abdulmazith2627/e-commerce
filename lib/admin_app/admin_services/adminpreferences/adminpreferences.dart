

import 'dart:convert';
import 'package:my_app/admin_app/admin_services/admin_function/admin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPreferences{

static Future<void> saveuserdata(userinfo)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var userJsondata = jsonEncode(userinfo);
    print(" pref: ${userJsondata}");
    await preferences.setString("currentadmin",userJsondata);
}

static Future<Admin?> getuserdata()async{
 Admin? data;
   SharedPreferences preferences=await SharedPreferences.getInstance();
   var getdata=preferences.getString("currentadmin");
   if(getdata!=null){
  print("Recived data : ${getdata.toString()}");
   data =Admin.fromJson(jsonDecode(getdata));
   print("email:${data.email.toString()}");
   print("username:${data.username.toString()}");
   print("id:${data.id.toString()}");
    
   }
  return data;

}
} 