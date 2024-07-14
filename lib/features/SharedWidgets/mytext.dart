import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mylargetext extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  Mylargetext(this.text,
      {super.key, this.size = 26, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Mytext extends StatelessWidget {
  final String text;
  final Color color;
  Mytext(this.text, {super.key, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            Theme.of(context).textTheme.displaySmall!.copyWith(color: color));
  }
}
