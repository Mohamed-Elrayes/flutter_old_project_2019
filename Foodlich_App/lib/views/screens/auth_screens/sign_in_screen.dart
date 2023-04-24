import 'package:eco/core/view_model/index_view_model.dart';
import 'package:eco/util/index_util.dart';
import 'package:eco/views/widgets/index_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class SignInScreen extends GetView<FormControl> {
  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FormControl());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: controller.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to",
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter your Phone number or Email\naddress for sign in. Enjoy your food :)",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 20,
                ),
                DecorationFormWidget(
                  child: TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: CommonStyle.textFieldStyle(
                      hintTextStr: "Email address",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          controller.pressedIcon.value
                              ? AntDesign.check
                              : Ionicons.md_phone_portrait_outline,
                          size: 20,
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                DecorationFormWidget(
                  child: TextFormField(
                    controller: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: CommonStyle.textFieldStyle(
                      hintTextStr: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.pressedPasswordEye.value =
                              !controller.pressedPasswordEye.value;
                        },
                        icon: Obx(
                          () => Icon(
                            controller.pressedPasswordEye.value
                                ? Entypo.eye_with_line
                                : Ionicons.eye_sharp,
                            color: Colors.green,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                Center(
                  child: Text(
                    'Forget Password?',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: AppColors.textDark.withOpacity(0.6)),
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                ButtonWidget(btnName: 'Sign in', onPressed: () {}),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have account? ',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: AppColors.textDark.withOpacity(0.6))),
                    Text(
                      'Create new account.',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: AppColors.activeColor),
                    )
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Or',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                ButtonWidget.facebook(onPressed: () {}),
                const SizedBox(
                  height: 16,
                ),
                ButtonWidget.google(onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
