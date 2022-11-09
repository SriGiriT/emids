import 'package:flutter/material.dart';

class ListOfTile extends StatelessWidget {
  bool isChecked;
  String listTitle;
  Function(bool ?) toggleTheCheckBox;
  VoidCallback longPressed;
  ListOfTile({required this.listTitle, required this.isChecked,required this.toggleTheCheckBox, required this.longPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: ListTile(
        leading: Icon(Icons.play_circle),
        onLongPress: longPressed,
        title: Text(
          listTitle,
          style: TextStyle(
            color: Color(0xFF6F35A5),
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Color(0xFF6F35A5),
          value: isChecked,
          onChanged: toggleTheCheckBox,
        ),
      ),
    );
  }
}
