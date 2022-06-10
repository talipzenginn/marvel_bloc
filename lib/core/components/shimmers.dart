import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/extension/context_extensions.dart';

class ImageShimmer extends StatelessWidget {
  const ImageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLowHorizontal,
      child: Shimmer.fromColors(
        baseColor: context.colorScheme.surface,
        highlightColor: context.colorScheme.tertiary,
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.tertiary,
            borderRadius: BorderRadius.circular(10),
          ),
          width: context.highValue * 3,
          height: context.highValue * 3,
        ),
      ),
    );
  }
}

class ShimmerForAll extends StatelessWidget {
  const ShimmerForAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.surface,
      highlightColor: context.colorScheme.tertiary,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            width: context.highValue * 3,
            height: context.highValue * 3,
          ),
          Container(
            margin: EdgeInsets.only(top: context.normalValue),
            color: Colors.transparent,
            width: context.highValue * 4,
            height: context.mediumValue,
          ),
        ],
      ),
    );
  }
}
