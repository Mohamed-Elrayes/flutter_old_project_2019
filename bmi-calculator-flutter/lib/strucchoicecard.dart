import 'package:flutter/material.dart';

import 'widget/constractors.dart';

class StrucChoiceCard extends StatelessWidget {
  final IconData iconKind;
  final String textKind;

  StrucChoiceCard({
    @required this.iconKind,
    @required this.textKind,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          iconKind,
          size: 80,
          color: KColourCardIcon,
        ),
        Text(
          textKind.toUpperCase(),
          style: KTextStyle,
        ),
      ],
    );
  }
}
