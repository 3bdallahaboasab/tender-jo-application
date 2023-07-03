import 'package:flutter/material.dart';
import 'package:flutter_template/Data/Constant/theme/color_constant.dart';
import 'package:flutter_template/Data/Functions/app_size.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final String? Function(dynamic)? validator;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final Color? fillColor;
  final int? maxLength;
  final int maxLines;
  final bool? readOnly;
  final EdgeInsetsGeometry? padding;
  final bool? haveBorder;
  final double? radius;
  final Function()? onTap;

  const CustomTextField(
    this.hintText, {
    this.onChanged,
    this.readOnly,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.focusNode,
    this.maxLines = 1,
    this.maxLength,
    Key? key,
    this.fillColor,
    this.haveBorder,
    this.padding,
    this.onTap,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly ?? false,
      onTap: onTap,
      validator: validator,
      focusNode: focusNode,
      style: TextStyle(fontSize: AppSize(context).smallText1),
      decoration: InputDecoration(
        counter: const SizedBox(),
        hintStyle: TextStyle(
            color: AppColors.greyColor1,
            fontSize: AppSize(context).smallText3,
            letterSpacing: .5),
        contentPadding: padding ?? const EdgeInsets.all(20.0),
        fillColor: fillColor ?? AppColors.whiteColor1,
        filled: true,
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: AppColors.greyColor1),
            borderRadius: BorderRadius.circular(radius ?? 10)),
        focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
                color: haveBorder == null
                    ? AppColors.greyColor1
                    : AppColors.whiteColor1),
            borderRadius: BorderRadius.circular(radius ?? 10)),
        disabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
                color: haveBorder == null
                    ? AppColors.greyColor1
                    : AppColors.whiteColor1),
            borderRadius: BorderRadius.circular(radius ?? 10)),
        enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
                color: haveBorder == null
                    ? AppColors.greyColor1
                    : AppColors.whiteColor1),
            borderRadius: BorderRadius.circular(radius ?? 10)),
        errorBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: const BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
      ),
    );
  }
}

class WidgetTextSearchFields extends StatelessWidget {
  final String? hintText;
  final bool? readOnly;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  const WidgetTextSearchFields(
      {super.key,
      this.hintText,
      this.controller,
      this.readOnly,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: AppSize(context).smallText1),
      controller: controller,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10.0),
        counter: const SizedBox(),
        hintStyle: TextStyle(
            color: AppColors.greyColor1,
            fontSize: AppSize(context).smallText3,
            letterSpacing: .5),
        hintText: hintText,
        border: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: AppColors.greyColor1),
            borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: AppColors.greyColor1),
            borderRadius: BorderRadius.circular(5)),
        disabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: AppColors.greyColor1),
            borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: AppColors.greyColor1),
            borderRadius: BorderRadius.circular(5)),
        errorBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: const BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
