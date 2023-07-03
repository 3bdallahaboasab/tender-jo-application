import 'package:flutter/material.dart';
import 'package:flutter_template/Data/Constant/Image/app_image.dart';
import 'package:flutter_template/Data/Functions/app_size.dart';
import 'package:flutter_template/Data/Functions/navigation.dart';
import 'package:flutter_template/Presentation/Auth/Screens/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigatorToFirstPage();
    super.initState();
  }

  navigatorToFirstPage() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        downToTop(const SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: AppSize(context).height,
        width: AppSize(context).width,
        child: Image(
          image: AppImage.splash,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
