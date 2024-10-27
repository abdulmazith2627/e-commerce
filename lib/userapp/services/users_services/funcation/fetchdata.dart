import 'dart:convert';


import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/userapp/services/userpreferences/userpreferences.dart';
import 'package:my_app/userapp/pages/home.dart';
import 'package:my_app/utils/apis.dart';
import 'package:my_app/userapp/services/users_services/funcation/users.dart';
import 'package:my_app/widgets/global/snackbar.dart';


class Fetchdata extends GetxController{

Future<String> signUp(
{
  required  String email,
  required  String password,
  required  String username,
}
)async{
  String res="running";

  try {
 Users userdata= Users(
     email: email,
     password: password, 
     username: username
     );

  final getdata=await http.post(
    Uri.parse(Apis.signupapi),
      headers:{
        'Content-Type': 'application/json',
      },
    body:jsonEncode(userdata)
    );

     if(getdata.statusCode==200){

      var getinfo=jsonDecode(getdata.body);

      if(getinfo["request"]==false){ 
        snack(title: 'Error',message:'Somethings missing');
      }
      else if(getinfo["userdetail"]==false){
         snack(title: 'Empty',message:'your details is missing so correctly full the form ');
      }
      else if(getinfo["email_validate"]==false){
         snack(title: 'Error',message:'Enter your email correctly');
      }
      else if(getinfo["already_register"]==true){
         snack(title: 'Already',message:'Already have this email so use another email');
      }
      else if(getinfo["success"]==true){
         snack(title: 'Success',message:'SignUp successfuly');
      }
      else if(getinfo["success"]==false){
         snack(title: 'faile',message:'SignUp failed');
      }
      
    }

    res="success";

  } catch (e) {
    return e.toString();
  }
   return res;
}


// Login 


Future<void> login( 
  {
  required  String email,
  required  String password,
  } 
  )async{
       String res="running";
  try {

  Map<String, dynamic> usersdata = {
    'email': email,
    'password': password,
  };
     final getdata=await http.post(
      Uri.parse(Apis.loginapi),
      headers:{
         'Content-Type': 'application/json',
      },
      body:jsonEncode(usersdata)
      );
      var userdata=jsonDecode(getdata.body);

          if(userdata['loginemail']==true){          
         await  UsersPreferences.saveuserdata(userdata['php_userdata']);
        Get.offAllNamed("/bar");
          }

          res="success";
       } catch (e) {
        print( "login: ${e.toString()}");
         
       }
      
}



}