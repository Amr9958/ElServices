import 'package:flutter/material.dart';

class GridViewbloc extends StatelessWidget {
  final Widget? child;
  GridViewbloc({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 1,
          mainAxisExtent: null),
      itemBuilder: (BuildContext context, int index) {
        return child;
      },
    );
  }
}
