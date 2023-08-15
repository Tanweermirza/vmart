import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vmart/consts/consts.dart';
import 'package:vmart/consts/lists.dart';
import 'package:vmart/views/auth_screen/signup_screen.dart';
import 'package:vmart/views/home_screen/home.dart';
import 'package:vmart/widgets_common/applogo_widget.dart';
import 'package:vmart/widgets_common/bg_widget.dart';
import 'package:vmart/widgets_common/custom_textfield.dart';
import 'package:vmart/widgets_common/our_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customTextfield(hint: emailHint, title: email),
                  customTextfield(hint: passwordHint, title: password),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetpass.text.make())),
                  5.heightBox,
                  // ourButton().box.width(context.screenWidth - 50).make(),
                  ourButton(
                      color: redColor,
                      title: login,
                      textColor: whiteColor,
                      onPress: () {
                        Get.to(() => const Home());
                      }).box.width(context.screenWidth - 50).make(),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
              5.heightBox,
              createNewAccount.text.color(fontGrey).make(),
              5.heightBox,
              ourButton(
                  color: lightgolden,
                  title: signup,
                  textColor: redColor,
                  onPress: () {
                    Get.to(() => const SignupScreen());
                  }).box.width(context.screenWidth - 70).make(),
              10.heightBox,
              loginWith.text.color(fontGrey).make(),
              5.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (index) => CircleAvatar(
                          backgroundColor: lightGrey,
                          radius: 25,
                          child: Image.asset(
                            socialIconList[index],
                            width: 30,
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
