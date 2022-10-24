import 'package:ambev_flutter/app/global/widgets/rounded_button.dart';
import 'package:ambev_flutter/app/global/widgets/rounded_input_field.dart';
import 'package:ambev_flutter/app/global/widgets/rounded_password_field.dart';
import 'package:ambev_flutter/app/modules/login/login_controller.dart';
import 'package:ambev_flutter/app/modules/login/widgets/already_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'widgets/background.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Entrar",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: Get.height * 0.03),
                SvgPicture.asset(
                  "assets/images/ambev.svg",
                  height: Get.height * 0.09,
                ),
                SizedBox(height: Get.height * 0.03),
                RoundedInputField(
                  hintText: "Nome de Usuário",
                  controller: controller.usernameCtrl,
                  onChanged: (value) {},
                ),
                Obx(
                  () => RoundedPasswordField(
                    changeShowPassword: () => {
                      controller.showPassword.value =
                          !controller.showPassword.value,
                    },
                    showPassword: controller.showPassword.value,
                    controller: controller.passwordCtrl,
                    onChanged: (value) {},
                  ),
                ),
                Obx(() => Visibility(
                      visible: !controller.loading.value,
                      child: RoundedButton(
                          text: "LOGIN",
                          press: () {
                            controller.login();
                          }),
                    )),
                Obx(() => Visibility(
                      visible: controller.loading.value,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: Get.width * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CircularProgressIndicator(),
                            ],
                          ),
                        ),
                      ),
                    )),
                AlreadyHaveAnAccountCheck(press: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
