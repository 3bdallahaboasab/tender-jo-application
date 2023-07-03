import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_template/Data/Constant/Image/app_image.dart';
import 'package:flutter_template/Data/Constant/theme/color_constant.dart';
import 'package:flutter_template/Data/Functions/app_size.dart';
import 'package:flutter_template/Data/Functions/navigation.dart';
import 'package:flutter_template/Presentation/Auth/Screens/signup_screen.dart';
import 'package:flutter_template/Presentation/Auth/managements_auth.dart';
import 'package:flutter_template/Presentation/Components/custom_button.dart';
import 'package:flutter_template/Presentation/Components/custom_text_from_fields.dart';
import 'package:flutter_template/Presentation/layout.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _key = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
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
                        'Login',
                        style: TextStyle(
                          fontSize: AppSize(context).largText,
                          color: AppColors.blackColor1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: AppSize(context).height * 0.16),
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
                      SizedBox(height: AppSize(context).height * 0.04),
                      // Login Button
                      Center(
                        child: CustomButton(
                          text: 'Log in',
                          height: AppSize(context).height * 0.06,
                          width: AppSize(context).width * 0.7,
                          radius: 35,
                          onTap: () => Navigator.pushAndRemoveUntil(
                              context,
                              rightToLeft(
                                const LayoutScreen(),
                              ),
                              (route) => false),
                        ),
                      ),
                      SizedBox(height: AppSize(context).height * 0.03),
                      // Forget Password
                      Center(
                        child: InkWell(
                          child: Text(
                            'Forget Your Password',
                            style: TextStyle(
                              fontSize: AppSize(context).mediumText3,
                              color: AppColors.blackColor1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: AppSize(context).height * 0.07),
                      // Forget Password
                      Center(
                        child: InkWell(
                          onTap: () => Navigator.pushAndRemoveUntil(
                              context,
                              rightToLeft(const SignUpScreen()),
                              (route) => false),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Don\'t Have An Account ? ',
                              style: TextStyle(
                                fontSize: AppSize(context).mediumText3,
                                color: AppColors.blackColor1,
                                fontWeight: FontWeight.w400,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'Join',
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
