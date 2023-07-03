import 'package:flutter/material.dart';
import 'package:flutter_template/Data/Constant/Image/app_image.dart';
import 'package:flutter_template/Data/Constant/theme/color_constant.dart';
import 'package:flutter_template/Data/Functions/app_size.dart';
import 'package:flutter_template/Presentation/Components/custom_text_from_fields.dart';

class OncePage extends StatefulWidget {
  const OncePage({Key? key}) : super(key: key);

  @override
  State<OncePage> createState() => _OncePageState();
}

class _OncePageState extends State<OncePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _customAppBar(context),
      endDrawer: const Drawer(),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: AppSize(context).width * 0.03),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Search
            CustomTextField(
              'Search',
              controller: search,
              padding: const EdgeInsets.all(8),
              radius: 50,
            ),
            SizedBox(height: AppSize(context).height * 0.01),
            // * Boxs
            SizedBox(
              height: AppSize(context).height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _customAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: AppSize(context).height * 0.12,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AppImage.profile,
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello! Kx.shopJo',
                style: TextStyle(
                  fontSize: AppSize(context).smallText1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                DateTime.now().toString().substring(0, 10),
                style: TextStyle(
                  fontSize: AppSize(context).smallText1,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
