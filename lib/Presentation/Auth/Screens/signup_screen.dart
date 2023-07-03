import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_template/Data/Constant/Image/app_image.dart';
import 'package:flutter_template/Data/Constant/theme/color_constant.dart';
import 'package:flutter_template/Data/Functions/app_size.dart';
import 'package:flutter_template/Data/Functions/navigation.dart';
import 'package:flutter_template/Presentation/Auth/Screens/signin_screen.dart';
import 'package:flutter_template/Presentation/Auth/managements_auth.dart';
import 'package:flutter_template/Presentation/Components/custom_button.dart';
import 'package:flutter_template/Presentation/Components/custom_phone_from_fields.dart';
import 'package:flutter_template/Presentation/Components/custom_text_from_fields.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _key = GlobalKey<FormState>();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  String countryCode = '+962';
  bool isShowPass1 = true;
  bool isShowPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // * Background Image
          Container(
            height: AppSize(context).height * 1.2,
            width: AppSize(context).width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AppImage.loginBackground,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // * Shadow
          Container(
            height: AppSize(context).height * 1.2,
            width: AppSize(context).width,
            decoration: BoxDecoration(
              color: AppColors.whiteColor1.withOpacity(0.7),
            ),
          ),
          // * Contents
          SafeArea(
            child: Container(
              width: AppSize(context).width,
              height: AppSize(context).height,
              padding: AppSize(context).appPadding,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppSize(context).height * 0.1),
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: AppSize(context).largText,
                          color: AppColors.blackColor1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: AppSize(context).height * 0.16),
                      //  * User Name
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              'First Name',
                              controller: _firstName,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value != '') {
                                  return null;
                                } else {
                                  return 'Required';
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              'Last Name',
                              controller: _lastName,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value != '') {
                                  return null;
                                } else {
                                  return 'Required';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      // * Email
                      CustomTextField(
                        'Email',
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (ManagementsAuth.validateEmail(value)) {
                            return null;
                          } else {
                            return 'Invalid email';
                          }
                        },
                      ),
                      // * Phone
                      CustomPhoneField(
                        onCountryChanged: (country) {
                          setState(() {
                            countryCode = country.code;
                          });
                        },
                        phoneController: _phone,
                      ),
                      // * Password
                      CustomTextField(
                        'Password',
                        controller: _password,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: isShowPass,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isShowPass = !isShowPass;
                            });
                          },
                          icon: Icon(
                            isShowPass == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        validator: (e) => ManagementsAuth.validatePassword(e),
                      ),
                      // * Confirm Password
                      CustomTextField(
                        'Confirm Password',
                        controller: _confirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isShowPass1,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isShowPass1 = !isShowPass1;
                            });
                          },
                          icon: Icon(
                            isShowPass1 == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        validator: (e) => ManagementsAuth.validatePassword(e),
                      ),
                      SizedBox(height: AppSize(context).height * 0.04),
                      // Register Button
                      Center(
                        child: CustomButton(
                          text: 'Register',
                          height: AppSize(context).height * 0.06,
                          width: AppSize(context).width * 0.7,
                          radius: 35,
                          onTap: () {},
                        ),
                      ),
                      SizedBox(height: AppSize(context).height * 0.05),
                      // Have An Account
                      Center(
                        child: InkWell(
                          onTap: () => Navigator.pushAndRemoveUntil(
                              context,
                              rightToLeft(const SignInScreen()),
                              (route) => false),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Have An Account ? ',
                              style: TextStyle(
                                fontSize: AppSize(context).mediumText3,
                                color: AppColors.blackColor1,
                                fontWeight: FontWeight.w400,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    fontSize: AppSize(context).mediumText3,
                                    color: AppColors.blackColor1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
