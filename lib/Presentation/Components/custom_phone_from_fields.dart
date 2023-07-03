import 'package:flutter/material.dart';
import 'package:flutter_template/Data/Constant/theme/color_constant.dart';
import 'package:flutter_template/Data/Functions/app_size.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneField extends StatefulWidget {
  final String? initCode;
  final Function(Country)? onCountryChanged;
  final TextEditingController phoneController;
  const CustomPhoneField(
      {super.key,
      required this.onCountryChanged,
      required this.phoneController,
      this.initCode});

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      onCountryChanged: widget.onCountryChanged,
      controller: widget.phoneController,
      invalidNumberMessage: null,
      style:
          TextStyle(color: Colors.black, fontSize: AppSize(context).smallText2),
      dropdownIcon: const Icon(Icons.keyboard_arrow_down_rounded),
      decoration: InputDecoration(
        counter: const SizedBox(),
        hintText: ' Phone Number',
        hintStyle: TextStyle(
            color: AppColors.lightGreyColor,
            fontSize: AppSize(context).smallText2),
        fillColor: AppColors.whiteColor1,
        filled: true,
        border: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: AppColors.whiteColor1),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: AppColors.whiteColor1),
            borderRadius: BorderRadius.circular(10)),
        disabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: AppColors.whiteColor1),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: AppColors.whiteColor1),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: const BorderSide(color: AppColors.whiteColor1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      initialCountryCode: widget.initCode ?? 'JO',
    );
  }
}
