import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/utils/images.dart';
import 'package:my_app/utils/textdata.dart';
import 'package:my_app/widgets/global/textform.dart';


class Adminotp extends StatefulWidget {
  const Adminotp({super.key});

  @override
  State<Adminotp> createState() => _AdminotpState();
}

class _AdminotpState extends State<Adminotp> {
    final TextEditingController _otp = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _otp.dispose();
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
                      SAText.otpsubtitle,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Textform(
                      hintText: SAText.otptext,
                      prefixIcon: null,
                      suffixIcon: null,
                      controller: _otp,
                      obscureText: false,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_otp.text.isNotEmpty) {
                        _otp.clear();
                        Get.toNamed("/adminnewpassword");
                      }
                    },
                    child: const Text(SAText.otpbuttontext)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}