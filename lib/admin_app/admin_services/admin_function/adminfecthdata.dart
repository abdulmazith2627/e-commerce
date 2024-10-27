import 'dart:convert';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/admin_app/admin_services/admin_function/admin.dart';
import 'package:my_app/admin_app/product/product.dart';
import 'package:my_app/admin_app/admin_services/adminpreferences/adminpreferences.dart';
import 'package:my_app/utils/apis.dart';
import 'package:my_app/widgets/global/snackbar.dart';

class Adminfecthdata extends GetxController {
  Future<String> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    String res = "running";

    try {
      Admin userdata =Admin(email: email, password: password, username: username, id: 0);

      final getdata = await http.post(Uri.parse(Apis.adminsignupapi),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(userdata));

      if (getdata.statusCode == 200) {
        var getinfo = jsonDecode(getdata.body);

        if (getinfo["request"] == false) {
          snack(title: 'Error', message: 'Somethings missing');
        } else if (getinfo["userdetail"] == false) {
          snack(
              title: 'Empty',
              message: 'your details is missing so correctly full the form ');
        } else if (getinfo["email_validate"] == false) {
          snack(title: 'Error', message: 'Enter your email correctly');
        } else if (getinfo["already_register"] == true) {
          snack(
              title: 'Already',
              message: 'Already have this email so use another email');
        } else if (getinfo["success"] == true) {
          snack(title: 'Success', message: 'SignUp successfuly');
        } else if (getinfo["success"] == false) {
          snack(title: 'faile', message: 'SignUp failed');
        }
      }

      res = "success";
    } catch (e) {
      return e.toString();
    }
    return res;
  }

// Login

  Future<String> login({
    required String email,
    required String password,
  }) async {
    String res = "running";
    try {
      Map<String, dynamic> usersdata = {
        'email': email,
        'password': password,
      };
      final getdata = await http.post(Uri.parse(Apis.adminloginapi),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(usersdata));

      var userdata = jsonDecode(getdata.body);

      if (userdata['loginemail'] == true) {
        await AdminPreferences.saveuserdata(userdata['userdata']);
        Get.offAllNamed("/adminhomepage");
      }

      res = "success";
    } catch (e) {
      return e.toString();
    }
    return res;
  }

}
