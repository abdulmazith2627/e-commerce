import 'dart:convert';
import 'dart:typed_data';

class Product {
  Uint8List image;
  String name;
  String price;
  String decription;
  int adminid;
  String offer;
  String shirtcolor;
  String  size;
  String gender;
  String delivery;
  String fabric;
  String sleeve;

  Product({
    required this.image,
    required this.name,
    required this.price,
    required this.decription,
    required this.adminid,
    required this.offer,
    required this.shirtcolor,
   required this.size,
    required this.gender,
     required this.delivery,
      required this.fabric,
       required this.sleeve,
  });
factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image:base64Decode(json['image']) as Uint8List,
       name:json['name'],
        price: json['price'], 
        decription: json['decription'],
         adminid: json['adminid'], 
         offer: json['offer'], 
         shirtcolor: json['shirtcolor'], 
         size: json['size'],
          gender:json['gender'], 
          delivery:json['delivery'], 
          fabric:json['fabric'], 
          sleeve:json['sleeve'],
         );
  }
  Map<String, dynamic> toJson() => {
        'image': base64Encode(image),
        'name': name,
        'price': price,
        'decription': decription,
        'adminid': adminid,
        'offer': offer,
        'shirtcolor':shirtcolor,
        'size':size,
        'gender':gender,
        'delivery':delivery,
        'fabric':fabric,
        'sleeve':sleeve,
      };
     @override
  String toString() {
    return 'Product{name: $name, price: $price, description: $decription, adminid: $adminid, offer: $offer}';
  }
}
