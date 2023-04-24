import 'package:flutter/material.dart';

class TileDescriptionWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onTapListTile ;

  TileDescriptionWidget({this.title, this.iconData ,this.onTapListTile });

  @override
  Widget build(BuildContext context) {
    return shapeTile(
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 1.0, color: Colors.grey),
            ),
          ),
          child: Icon(iconData),
        ),
        title: Text(title),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 10,
        ),
        onTap: onTapListTile,
        onLongPress: (){

        },
      ),
    );
  }

  Widget shapeTile({Widget child}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: const Offset(0, 5),
              blurRadius: 10,
              spreadRadius: 0),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(9)),
        color: Colors.white,
      ),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: const BorderRadius.all(Radius.circular(9)),
        clipBehavior: Clip.antiAlias,
        child: child,
      ),
    );
  }
}
