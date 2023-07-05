import 'package:flutter/material.dart';
import '../core/utils/app_color.dart';

class TextFieldComponent extends StatelessWidget {
   TextFieldComponent({Key? key,
    required this.hintText
    ,@required this.suffex,
    @required this.onTap,
    required this.textEditingController}) : super(key: key);
   final String hintText;
   final Widget? suffex;
   final  void Function()? onTap;
    TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:textEditingController ,
      onTap: onTap,
      decoration: InputDecoration(
         suffixIcon:suffex,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.greyColor)
          ),enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.greyColor)
      )
      ),
    );
  }
}
