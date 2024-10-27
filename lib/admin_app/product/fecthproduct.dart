import 'dart:convert';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/admin_app/product/product.dart';
import 'package:my_app/utils/apis.dart';

class Fecthproduct extends GetxController {
  Future<String> sendProductData({
  required Uint8List image,
  required String productname,
  required String productprice,
  required String productoffer,
  required String productdecrip,
  required int adminid,
  required String shirtcolor,
   required String  size,
    required String gender,
     required String delivery,
      required String fabric,
       required String sleeve,
}) async {
  String res = "error";
  try {
    Product product = Product(
        image: image,
        name: productname,
        price: productprice,
        decription: productdecrip,
        adminid: adminid,
        offer: productoffer==''?'':productoffer,
         shirtcolor:shirtcolor, 
         size:size, 
         gender:gender, 
         delivery:delivery,
          fabric:fabric,
          sleeve:sleeve,
        
        );

    final getdata = await http.post(Uri.parse(Apis.sendproductapi),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(product));

    var getproductdata = jsonDecode(getdata.body);

    if (getdata.statusCode == 200 && getproductdata["success"] == true) {
      print('Data inserted successfully');
      res = "success";
    } else {
      print('Failed to insert data: ${getproductdata["error"]}');
    }
  } catch (e) {
    print('Exception: ${e.toString()}');
  }

  return res;
}





  List<Product> data=[];
Future<List<Product>?> getProductdata(
  {required int id}
)async{

 try {
   Map<String,dynamic>adminid={'adminid':id};
   print("admin Id : ${adminid.toString()}");

    final getdata=await http.post(
      Uri.parse(Apis.getproductapi),
       headers: {'Content-Type': 'application/json',},
       body:jsonEncode(adminid)
      );
     var getproductdata=jsonDecode(getdata.body);
     print(getproductdata['productdata'].toString());
      List products = getproductdata['productdata'];
       data= products.map((product) => Product.fromJson(product)).toList();
      print(data.toList().toString());
 } catch (e) {
   print("Flutter Exception : ${e.toString()}");
 }
 
     return data;
     
}






Future<List> getAllProductData() async {
  List productdatas=[];
  try {
    final response = await http.get(
      Uri.parse("http://192.168.1.43/myshopall/product/getallproductdata.php"),
      headers: {'Content-Type': 'application/json'},
    );

    print('Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      var productData = jsonDecode(response.body);

      if (productData['getdata'] == true) {
        print("Data fetched successfully");
     productdatas=productData['productdata'];
     print(productdatas.toList().toString());
        // for (var product in productData['productdata']) {
        //   print('Product ID: ${product['id']}, Name: ${product['name']}, Price: ${product['price']}');
        // }
      } else {
        print("No products found");
      }
    } else {
      print("Failed to fetch data: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
  }

  return productdatas;

}



    
  }


