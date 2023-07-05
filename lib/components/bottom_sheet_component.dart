


import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_color.dart';

class BottomSheetComponent extends StatelessWidget {
  const BottomSheetComponent({Key? key, required this.text, required this.color, required this.onTap}) : super(key: key);
  final String text;
  final Color color;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap
      ,child: Container(
        alignment: Alignment.center,
        height: 45,
        width: 350,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: color!=AppColor.whiteColor?color:AppColor.greyColor),
          borderRadius: const BorderRadius.only(
              topRight:Radius.circular(18)
              ,topLeft: Radius.circular(18)
              ,bottomRight: Radius.circular(18),bottomLeft:Radius.circular(18) )
        ),
        child: Text(text,style: TextStyle(
          color: color==AppColor.whiteColor?AppColor.blackColor:AppColor.whiteColor
            ,fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
