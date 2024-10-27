import 'package:get/get.dart';
import 'package:my_app/admin_app/admin_services/admin_function/admin.dart';
import 'package:my_app/admin_app/admin_services/adminpreferences/adminpreferences.dart';


class CurrentAdmin extends GetxController{
  final Rx<Admin> _currentuser=Admin(
    id:0,
    email: '',
     password: '', 
     username: ''
     ).obs;

     Admin get userdata=>_currentuser.value;

     getuserdata()async{
      Admin? getuserdataformlocaldatabase=await AdminPreferences.getuserdata();
      _currentuser.value=getuserdataformlocaldatabase!;
     }
}