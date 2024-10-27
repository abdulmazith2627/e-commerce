import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:my_app/admin_app/admin_services/admin_function/adminfecthdata.dart';
import 'package:my_app/admin_app/admin_services/adminpreferences/current_admin.dart';
import 'package:my_app/admin_app/product/fecthproduct.dart';
import 'package:my_app/widgets/features/imagepicker.dart';
import 'package:my_app/widgets/global/textform.dart';

import 'dart:typed_data';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  final TextEditingController _productname = TextEditingController();
  final TextEditingController _productdecription = TextEditingController();
  final TextEditingController _productprice = TextEditingController();
  final TextEditingController _productoffer = TextEditingController();

   final TextEditingController _shirtcolor = TextEditingController();
  final TextEditingController _size = TextEditingController();
  final TextEditingController _gender = TextEditingController();
   final TextEditingController _delivery = TextEditingController();
  final TextEditingController _fabric = TextEditingController();
  final TextEditingController _sleeve = TextEditingController();

  final getproductdata = Get.put(Fecthproduct());
  final getadmindata = Get.put(CurrentAdmin());

  Uint8List? _imageBytes;


  // Method to select an image using file picker
  Future<void> seleimage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
      );
      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _imageBytes = result.files.first.bytes;
        });
      }
    } catch (e) {
      print("Error picking image: $e");
      // Handle the error, show an alert or Snackbar if needed
    }
  }

  // Method to send product data
Future<void> sendproductdata() async {
  if (_imageBytes != null) {
    await getproductdata.sendProductData(
      image: _imageBytes!,
      productname: _productname.text,
      productprice: _productprice.text,
      productoffer: _productoffer.text,
      productdecrip: _productdecription.text,
      adminid: getadmindata.userdata.id, 
      shirtcolor:_shirtcolor.text, 
      size: _size.text, 
      gender:_gender.text, 
      delivery:_delivery.text, 
      fabric:_fabric.text, 
      sleeve:_sleeve.text,
    );
  }
}
  @override
  void dispose() {
    _productname.dispose();
    _productdecription.dispose();
    _productprice.dispose();
    _productoffer.dispose();

    // product details:
   _shirtcolor.dispose();
   _size.dispose();
   _gender.dispose();
   _delivery.dispose();
   _fabric.dispose();
   _sleeve.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        actions: [
          TextButton(
            onPressed: () {
              if (_productname.text.isNotEmpty &&
                  _productdecription.text.isNotEmpty &&
                  _productprice.text.isNotEmpty) {
                sendproductdata();
                // Reset the form and clear the selected image
                setState(() {
                  _imageBytes = null;
                });
                _productname.clear();
                _productdecription.clear();
                _productprice.clear();
                _productoffer.clear();

                _shirtcolor.clear();
                _size.clear();
                _delivery.clear();
                _gender.clear();
                _fabric.clear();
                _sleeve.clear();
              } else {
                // Show error if required fields are empty
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill all required fields.'),
                  ),
                );
              }
            },
            child: const Text("Publish"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: seleimage,
                child: _imageBytes == null
                    ? Container(
                        width: 300,
                        height: 300,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 50,
                        ),
                      )
                    : Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: MemoryImage(_imageBytes!),
                            // fit: BoxFit.,
                          ),
                        ),
                      ),
              ),
              Textform(
                hintText: "Product Name",
                controller: _productname,
              ),
              Textform(
                hintText: "Product Price",
                controller: _productprice,
                keyboardType: TextInputType.number,
              ),
              Textform(
                hintText: "Product Offer",
                controller: _productoffer,
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _productdecription,
                  decoration: const InputDecoration(
                    hintText: "Product Description",
                  ),
                  maxLines: 3,
                  minLines: 2,
                ),
              ),

          Text("Product Details",style:Theme.of(context).textTheme.bodySmall,),

          Textform(
                hintText: "enter the Shirt Color",
                controller: _shirtcolor,
                keyboardType: TextInputType.number,
              ),


              Textform(
                hintText: "enter the Size",
                controller: _size,
                keyboardType: TextInputType.number,
              ),


              Textform(
                hintText: "enter the gender",
                controller: _gender,
                keyboardType: TextInputType.number,
              ),


              Textform(
                hintText: "enter the Delivery charger",
                controller: _delivery,
                keyboardType: TextInputType.number,
              ),

              Textform(
                hintText: "enter the fabric",
                controller: _fabric,
                keyboardType: TextInputType.number,
              ),


            Textform(
                hintText: "enter the sleeve",
                controller: _sleeve,
                keyboardType: TextInputType.number,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

// Custom Textform widget (if you have this widget defined elsewhere, use it)
class Textform extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const Textform({
    required this.hintText,
    required this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
