import 'package:flutter/material.dart';
import 'package:tasks_app/components/textfield_component.dart';
import 'package:tasks_app/core/utils/app_color.dart';

class RemindRepeatComponent extends StatelessWidget {
  RemindRepeatComponent({ required this.hintText, required this.onChanged, required this.controller, required this.iteamsList});
 final String hintText;
 final void Function(String?) onChanged;
 final TextEditingController controller;
 final List <DropdownMenuItem<String>>iteamsList;
  @override
  Widget build(BuildContext context) {
    return TextFieldComponent(
      hintText: hintText
      , suffex: DropdownButton<String>(
      value: null,
      icon: const Icon(Icons.keyboard_arrow_down_outlined,
        color: AppColor.blueColor,),
      style: TextStyle(color: AppColor.blueColor),
      onChanged: onChanged,
      items: iteamsList
      ,), textEditingController: controller
    );
  }
}
