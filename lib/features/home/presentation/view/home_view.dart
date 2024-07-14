import 'package:Elservices/features/SharedWidgets/customAppbar.dart';
import 'package:Elservices/features/SharedWidgets/mytext.dart';
import 'package:Elservices/features/home/presentation/view/widget/blocs.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/colors.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _GridViewblocState();
}

GlobalKey<NavigatorState> HomePageNavigatorKey = GlobalKey<NavigatorState>();

class _GridViewblocState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //App bar
              customAppbar(
                title: 'خدماتك',
                arrow: false,
                center: true,
              ),
              CarouselSlider(
                options: CarouselOptions(
                    height: 120.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    autoPlayAnimationDuration: const Duration(milliseconds: 1500)),
                items: [
                  'imgs/mmcassits/1.png',
                  'imgs/mmcassits/2.png',
                  'imgs/mmcassits/3.png'
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: Image.asset(i, fit: BoxFit.cover),
                      );
                    },
                  );
                }).toList(),
              ),

              //body
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Mylargetext(
                        "خدمات اخري ",
                        color: FxColors.secondary,
                      ),
                    ),
                    const Divider(color: FxColors.primary),
                    circleGridBloc(context),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Mylargetext(
                        "رائجة اليوم",
                        color: FxColors.secondary,
                      ),
                    ),
                    const Divider(color: FxColors.primary),
                    circleGridBloc(context),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Mylargetext(
                        "رائج ",
                        color: FxColors.secondary,
                      ),
                    ),
                    const Divider(color: FxColors.primary),
                    rectangleGridbloc(context),
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
