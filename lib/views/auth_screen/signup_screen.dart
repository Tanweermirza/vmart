import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:vmart/consts/consts.dart';
import 'package:vmart/controllers/auth_controller.dart';
import 'package:vmart/widgets_common/bg_widget.dart';

// import '../../consts/lists.dart';

import '../../widgets_common/applogo_widget.dart';

import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  // const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? ischeck = false;
  // object
  var controller = Get.put(AuthController());
  // text controller
  var nameContoller = TextEditingController();
  var emailContoller = TextEditingController();
  var passwordContoller = TextEditingController();
  var passwordRetypeContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgwidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Join the $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customTextfield(
                      hint: nameHint, title: name, controller: nameContoller),
                  customTextfield(
                      hint: passwordHint,
                      title: password,
                      controller: emailContoller),
                  customTextfield(
                      hint: passwordHint,
                      title: password,
                      controller: passwordContoller),
                  customTextfield(
                      hint: passwordHint,
                      title: retypePassword,
                      controller: passwordRetypeContoller),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetpass.text.make())),
                  5.heightBox,
                  // ourButton().box.width(context.screenWidth - 50).make(),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(12)),
                  Checkbox(
                    checkColor: redColor,
                    value: ischeck,
                    onChanged: (newValue) {
                      setState(() {
                        ischeck = newValue;
                      });
                    },
                  ),
                  10.heightBox,
                  Expanded(
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                        text: "I agree to the ",
                        style: TextStyle(
                          fontFamily: regular,
                          color: fontGrey,
                        ),
                      ),
                      TextSpan(
                          text: termAndCond,
                          style: TextStyle(
                            fontFamily: regular,
                            color: redColor,
                          )),
                      TextSpan(
                          text: "&",
                          style:
                              TextStyle(fontFamily: regular, color: fontGrey)),
                      TextSpan(
                          text: privacyPolicy,
                          style:
                              TextStyle(fontFamily: regular, color: redColor)),
                    ])),
                  ),
                ],
              ),
              ourButton(
                color: ischeck == true ? redColor : lightGrey,
                title: signup,
                textColor: whiteColor,
                onPress: () {},
              ).box.width(context.screenWidth - 50).make(),
              10.heightBox,
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: alreadyHaveAccount,
                      style: TextStyle(fontFamily: regular, color: fontGrey),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          log("clickrd");
                          Get.back();
                        },
                      text: login,
                      style: const TextStyle(fontFamily: bold, color: redColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
