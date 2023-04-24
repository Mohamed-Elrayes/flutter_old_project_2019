import 'package:eco/util/index_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

enum SocialButton { facebook, google, non }

class ButtonWidget extends StatelessWidget {
  final String btnName;
  final VoidCallback onPressed;
  final Color color;
  final SocialButton socialButton;
  final IconData? icon;
  // final bool isSocialMedia ;

  const ButtonWidget(
      {Key? key,
      required this.btnName,
      required this.onPressed,
      this.socialButton = SocialButton.non,
      // ignore: avoid_init_to_null
      this.icon = null,
      this.color = AppColors.activeColor})
      : super(key: key);

  const ButtonWidget.facebook({
    Key? key,
    required this.onPressed,
  })  : btnName = "Connect with Facebook",
        socialButton = SocialButton.facebook,
        color = const Color(0XFF395998),
        icon = Zocial.facebook,
        super(key: key);

  const ButtonWidget.google({
    Key? key,
    required this.onPressed,
  })  : btnName = "Connect with Google",
        socialButton = SocialButton.google,
        color = const Color(0xFF4285F4),
        icon = AntDesign.google,
        super(key: key);

// 395998
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                return color;
              }),
            ),
            onPressed: onPressed,
            child: socialButton == SocialButton.non
                ? Text(btnName.toUpperCase())
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(icon , ),
                      const Spacer(),
                      Text(
                        btnName.toUpperCase(),
                      ),
                      const Spacer(),
                    ],
                  )),
      ),
    );
  }
}
