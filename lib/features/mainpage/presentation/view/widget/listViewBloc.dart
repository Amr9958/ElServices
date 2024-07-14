import 'package:Elservices/features/SharedWidgets/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListViewbloc extends StatelessWidget {
  final Widget? child;
  final Axis scrollDirection;
  final int count;
  ListViewbloc({
    super.key,
    required this.child,
    required this.scrollDirection,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: count,
      scrollDirection: scrollDirection,
      itemBuilder: (BuildContext context, int index) {
        return child;
      },
    );
  }
}
