import 'package:get/get.dart';
import 'package:my_app/userapp/services/userpreferences/userpreferences.dart';
import 'package:my_app/userapp/services/users_services/funcation/users.dart';

class CurrentUser extends GetxController{
  final Rx<Users> _currentuser=Users(
    email: '',
     password: '', 
     username: ''
     ).obs;

     Users get userdata=>_currentuser.value;

     getuserdata()async{
      Users? getuserdataformlocaldatabase=await UsersPreferences.getuserdata();
      _currentuser.value=getuserdataformlocaldatabase!;
     }
}