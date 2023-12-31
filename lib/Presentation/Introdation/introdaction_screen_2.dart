import 'package:flutter/material.dart';
import 'package:flutter_template/Data/Functions/app_size.dart';
import 'package:flutter_template/Presentation/Components/custom_cach_network_image.dart';

class IntrodactionScreen2 extends StatelessWidget {
  const IntrodactionScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppSize(context).height * 0.02,
              horizontal: AppSize(context).width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppSize(context).height * 0.4,
                child: const CustomCachNetworkImage(
                  image:
                      'https://www.equitechsoftwares.com/assets/images/logodesign.jpg',
                ),
              ),
              SizedBox(height: AppSize(context).height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppSize(context).height * 0.02,
                    horizontal: AppSize(context).width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Secund Screen',
                      style: TextStyle(
                        fontSize: AppSize(context).mediumText1,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: AppSize(context).height * 0.07),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          'Templete App Using For All application we build ',
                          style: TextStyle(
                              fontSize: AppSize(context).mediumText3,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 0.2,
                              height: 1.5),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
