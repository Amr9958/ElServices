import 'package:Elservices/core/helpers/colors.dart';
import 'package:Elservices/features/home/cubit/allservicesState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../SharedWidgets/mytext.dart';
import '../../../cubit/allServicescubit.dart';

Widget rectangleGridbloc(BuildContext context) {
  return Container(
    height: 150.h,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: FxColors.primary.withOpacity(0.4),
                        ),
                      ],
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5.w,
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
                  color: FxColors.secondary_Dark,
                )
              ],
            ),
          );
        }),
  );
}

Widget circleGridBloc(BuildContext context) {
  return BlocBuilder<Allservicescubit, Allservicesstate>(
    builder: (context_, state) {
      if (state is Allservicesstateloading) {
        return const Center(
            child: CircularProgressIndicator(
          backgroundColor: FxColors.primary,
        ));
      } else if (state is Allservicesstatesucsess) {
        List allServices = state.allServicesModel.allServicesModel;
        return Container(
          height: 100.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: allServices.length,
              itemBuilder: (context, index) {
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.w),
                      child: CircleAvatar(
                        radius: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5.w,
                            ),
                          ),
                          child: ClipOval(
                            child: Padding(
                              padding: const EdgeInsets.all(0),
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
                      fontSize: 14,
                      '${allServices[index]}',
                      color: FxColors.secondary_Dark,
                    )
                  ],
                );
              }),
        );
      } else {
        if (state is Allservicesstateerror) {
          return Text(state.message);
        } else {
          return const Text('un handled error');
        }
      }
    },
  );
}
