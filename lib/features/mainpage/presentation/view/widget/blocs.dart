import 'package:Elservices/features/home/presentation/view/widget/listViewBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../SharedWidgets/mytext.dart';

Widget rectangleGridbloc() {
  return Container(
    height: 150.h,
    child: ListViewbloc(
        scrollDirection: Axis.horizontal,
        count: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.r))),
                child: ClipOval(
                  child: Image.asset(
                    'imgs/hiking.png',
                    fit: BoxFit.cover,
                    width: 180.w,
                    height: 120.h,
                  ),
                ),
              ),
              Mytext(
                'text',
              )
            ],
          ),
        )),
  );
}

Widget circleGridBloc() {
  return Container(
    height: 100.h,
    child: ListViewbloc(
        scrollDirection: Axis.horizontal,
        count: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.w),
              child: CircleAvatar(
                radius: 40,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.w,
                    ),
                  ),
                  child: ClipOval(
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Image.asset(
                        'imgs/emailVerification.jpg',
                        fit: BoxFit.cover,
                        width: 200.w,
                        height: 120.h,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Mytext(
              'text',
            )
          ],
        )),
  );
}
