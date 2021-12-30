
import 'package:flutter/material.dart';

class HelpViewDetails
{
  Icon icon;
  String text;
  String subTitleText;
  String imagePath;
  HelpViewDetails({required this.icon, required this.text,required this.subTitleText,required this.imagePath});
}


void hideKeyBoard(BuildContext context) {
  try {
    FocusScope.of(context).unfocus();
  } catch (e) {
    print(e);
  }
}
