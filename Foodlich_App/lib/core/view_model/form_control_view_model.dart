import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormControl extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  var pressedIcon = false.obs;
  var pressedPasswordEye = false.obs;

  // String email;
  // String password;
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();

    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String val) {
    if (GetUtils.isEmail(val)) {
      pressedIcon.value = true;
      // return ;
    }
    return "Please this field must be filled";
  }

  String? validatePassword(String val) {
    if (val.length < 5) {
      return "Please this field must be filled";
    }
    return null;
  }

  void login() {
    final isValid = loginFormKey.currentState?.validate();

    if (!isValid!) {
      checkUser(emailController.text, passwordController.text).then((auth) {
        if (auth) {
          loginFormKey.currentState?.save();
          Get.snackbar('Login', 'Login successfully');
        } else {
          Get.snackbar('Login', 'Invalid email or password');
        }
        passwordController.clear();
      });
    }
  }

  // Api Simulation
  Future<bool> checkUser(String user, String password) {
    if (user == 'foo@foo.com' && password == '123') {
      return Future.value(true);
    }

    return Future.value(false);
  }
}
