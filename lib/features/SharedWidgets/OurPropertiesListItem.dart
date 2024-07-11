import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OurProvidingListItem extends StatelessWidget {
  IconData iconData;
  String title;
  OurProvidingListItem(this.iconData, this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.5.h),
      child: Row(
        children: [
          Icon(
            iconData,
            // color: Colors.black45,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 15.w,
            ),
          )
        ],
      ),
    );
  }
}
