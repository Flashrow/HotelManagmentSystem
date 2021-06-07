import 'package:flutter/material.dart';
import 'package:hotel_management_system/utils/colorTheme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.titleText = "Title",
    this.hintText = "Hint",
    //this.onChange,
  }) : super(key: key);

  final String titleText;
  final String hintText;
  //final Function onChange;

  @override
  Widget build(BuildContext context) {
    ColorTheme myColors = ColorTheme();
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              titleText,
              style: TextStyle(
                color: myColors.themeData.colorScheme.primary,
                fontSize: 12,
                fontFamily: 'RobotoMono',
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                filled: false,
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: myColors.themeData.colorScheme.primary),
                ),
                hintText: hintText,
                contentPadding: EdgeInsets.all(8),
              ),
              //onChanged: onChange,
            )
          ],
        ),
      ),
    );
  }
}
