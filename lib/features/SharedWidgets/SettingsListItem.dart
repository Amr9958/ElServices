import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SettingsListItem extends StatelessWidget {
  final IconData? iconData;
  final String title;
  final void Function() onTap;
  final bool links;
  const SettingsListItem(this.iconData, this.title, this.onTap,
      {super.key, this.links = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
            decoration: (links == false)
                ? const BoxDecoration(border: Border(bottom: BorderSide()))
                : null,
            child: Padding(
              padding: (links == false)
                  ?  EdgeInsets.symmetric(vertical: 15.h)
                  : const EdgeInsets.symmetric(vertical: 0),
              child: Row(
                children: [
                  (iconData != null)
                      ? Icon(
                          iconData,
                        )
                      : const SizedBox(),
                   SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.w,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
