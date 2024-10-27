
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/utils/images.dart';
import 'package:my_app/utils/textdata.dart';
import 'package:my_app/widgets/global/textform.dart';

class Adminsendemail extends StatefulWidget {
  const Adminsendemail({super.key});

  @override
  State<Adminsendemail> createState() => _AdminsendemailState();
}

class _AdminsendemailState extends State<Adminsendemail> {
    final TextEditingController _email = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
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
                      SAText.admin,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      SAText.sendemailforreset,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Textform(
                      hintText: SAText.emailtext,
                      prefixIcon: null,
                      suffixIcon: null,
                      controller: _email,
                      obscureText: false,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_email.text.isNotEmpty) {
                        _email.clear();
                        Get.toNamed("/adminotp");
                      }
                    },
                    child: const Text(SAText.sendemail)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}