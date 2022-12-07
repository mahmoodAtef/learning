import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning/src/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/core/utils/color_manager.dart';

Widget defaultTextField(
    {String? hint, IconData? prefix, IconData? suffix, String? validate}) {
  return Container(
    decoration: BoxDecoration(
        color: ColorManager.white, borderRadius: BorderRadius.circular(8)),
    clipBehavior: Clip.antiAlias,
    child: TextFormField(
      validator: (value) {
        return validate;
      },
      decoration: InputDecoration(
          hintText: hint,
          suffix: Icon(suffix),
          prefix: Icon(prefix),
          hintStyle: TextStyle(color: ColorManager.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    ),
  );
}

TextFormField defaultFormField(
    {required String label,
    required IconData prefix,
    IconData? suffix,
    GlobalKey? key,
    String? validatorText,
    TextInputType? type,
    void Function()? suffixFunction,
    bool obscureText = false,
    required TextEditingController controller}) {
  TextFormField textFormField = TextFormField(
    // key: key,
    // validator: (value)
    // {
    //
    //   if (controller.text == null){
    //     return validatorText ;
    //   }
    //   else {
    //     return null;
    //   }
    // },
    validator: (value) {
      if (value!.isEmpty) {
        return validatorText;
      }
      return null;
    },
    keyboardType: type,
    obscureText: obscureText,
    controller: controller,
    cursorColor: ColorManager.black,
    decoration: InputDecoration(
      prefixIcon: Icon(prefix, color: ColorManager.black),
      suffix: suffix != null
          ? InkWell(
              child: Icon(suffix),
              onTap: suffixFunction,
            )
          : const SizedBox(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(width: 2, color: ColorManager.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(width: 2, color: ColorManager.primary),
      ),
      labelText: label,
      labelStyle: TextStyle(color: ColorManager.primary),
    ),
    style: TextStyle(color: ColorManager.primary),
  );
  // textFormField.validator = (value) {
  //   if (value!.isEmpty)
  //   {
  //     return 'Please enter Email Address';
  //   }
  //   return null;
  // };
  return TextFormField(
    // key: key,
    // validator: (value)
    // {
    //
    //   if (controller.text == null){
    //     return validatorText ;
    //   }
    //   else {
    //     return null;
    //   }
    // },
    validator: (value) {
      if (value!.isEmpty) {
        return validatorText;
      }
      return null;
    },
    keyboardType: type,
    obscureText: obscureText,
    controller: controller,
    cursorColor: ColorManager.black,
    decoration: InputDecoration(
      prefixIcon: Icon(prefix, color: ColorManager.black),
      suffix: suffix != null
          ? InkWell(
              child: Icon(suffix),
              onTap: suffixFunction,
            )
          : const SizedBox(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(width: 2, color: ColorManager.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(width: 2, color: ColorManager.primary),
      ),
      labelText: label,
      labelStyle: TextStyle(color: ColorManager.primary),
    ),
    style: TextStyle(color: ColorManager.primary),
  );
}


 defaultToast ({required String msg , })
{

   Fluttertoast.showToast(msg: msg , backgroundColor: ColorManager.primary, textColor: ColorManager.white, toastLength: Toast.LENGTH_SHORT ,  );
}
errorToast ({required String msg ,}){
  Fluttertoast.showToast(msg: msg , backgroundColor: ColorManager.error, textColor: ColorManager.white, toastLength: Toast.LENGTH_SHORT ,  );

}