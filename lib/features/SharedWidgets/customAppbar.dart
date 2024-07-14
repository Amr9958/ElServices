import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helpers/colors.dart';

class customAppbar extends StatelessWidget {
  final String title;
  final bool arrow;
  final bool center;
  customAppbar({
    super.key,
    required this.title,
    this.arrow = true,
    required this.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(color: FxColors.primary, width: 1.w),
          top: BorderSide(color: FxColors.primary, width: 1.w),
        ),
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        child: Row(
          children: [
            !arrow
                ? IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      // color: ColorsManager.Color10Light,
                    ))
                : IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    )),
            Expanded(
              child: Text(
                title,
                textAlign: center ? TextAlign.center : null,
                maxLines: 2,
                style:
                    TextStyle(fontSize: 24.sp, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
