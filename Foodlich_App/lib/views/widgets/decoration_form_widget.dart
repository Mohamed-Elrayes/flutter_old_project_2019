import 'package:flutter/material.dart';

class DecorationFormWidget extends StatelessWidget {
  const DecorationFormWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0XFFFBFBFB),
          border: Border.all(color: const Color(0xFFF3F2F2), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child);
  }
}
