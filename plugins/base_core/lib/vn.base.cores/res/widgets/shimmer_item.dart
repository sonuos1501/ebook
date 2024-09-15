import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({super.key, this.height = 100, this.width = 150});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).dividerColor,
      highlightColor:
          Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.dp),
          color: Colours
              .greyLight[300], // This color will be replaced by actual content
        ),
        height: height,
        width: width,
      ),
    );
  }
}
