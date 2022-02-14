import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/colors.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton(
      {Key? key, this.height, this.width, this.opacity, this.padding = 16})
      : super(key: key);

  final double? height, width, opacity;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade900,
      highlightColor: Colors.grey.shade600,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(padding / 2),
        decoration: BoxDecoration(
            color: backgroundColorApp.withOpacity(opacity ?? 1.0),
            borderRadius: BorderRadius.all(Radius.circular(padding / 2))),
      ),
    );
  }
}
