import 'package:flutter/material.dart';
import '../utils/app_color.dart';
ThemeData darkTheme(){
  return ThemeData(
    scaffoldBackgroundColor: AppColor.blackColor,
    primaryColor: AppColor.primaryColor,
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
          color: AppColor.greyColor
      ),
      color: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColor.whiteColor,
        size: 25,
      ),
    ),
      iconTheme: IconThemeData(
          color: AppColor.greyColor
      ),
    buttonTheme:ButtonThemeData(
      buttonColor: Colors.green
    ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: AppColor.blackColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          color: AppColor.greyColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: AppColor.whiteColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      )
  );
}
/// ***///////////////////////////////////////////////////////////////////////////***
ThemeData lightTheme(){
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColor.primaryColor,
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(
          color: AppColor.greyColor
        ),
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
          color: AppColor.blackColor,
        size: 25
      )
  ),
    iconTheme: const IconThemeData(
      color: AppColor.greyColor
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor:MaterialStatePropertyAll<Color>(AppColor.primaryColor),
          foregroundColor: MaterialStatePropertyAll<Color>(AppColor.whiteColor),
          minimumSize: MaterialStatePropertyAll<Size>(Size(35, 45)),
        ),
      ),
textTheme: const TextTheme(
     bodyLarge: TextStyle(
       color: AppColor.blackColor,
       fontSize: 20,
       fontWeight: FontWeight.bold,
     ),
  bodySmall: TextStyle(
    color: AppColor.greyColor,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ),
  bodyMedium: TextStyle(
  color: AppColor.blackColor,
  fontSize: 18,
  fontWeight: FontWeight.bold,
),
)
  );

}