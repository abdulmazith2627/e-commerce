import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/utils/images.dart';
import 'package:my_app/utils/textdata.dart';
import 'package:my_app/widgets/global/textform.dart';

class Adminresetpassword extends StatefulWidget {
  const Adminresetpassword({super.key});

  @override
  State<Adminresetpassword> createState() => _AdminresetpasswordState();
}

class _AdminresetpasswordState extends State<Adminresetpassword> {
    final TextEditingController _restpassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _restpassword.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Theme.of(context).brightness ==
                                      Brightness.light
                                  ? SAimage.logoimagelight
                                  : SAimage.logoimagedark))),
                    ),
                    Text(
                      SAText.titletext,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      SAText.resetpasswordtext,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Textform(
                      hintText: SAText.newpasswordtext,
                      prefixIcon: null,
                      suffixIcon: null,
                      controller: _restpassword,
                      obscureText: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      _restpassword.clear();
                      Get.offAllNamed("/adminlogin");
                    },
                    child: const Text(SAText.resetbuttontext)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}