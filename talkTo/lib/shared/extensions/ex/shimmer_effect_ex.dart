// part of '../ex.dart';


// extension ShimmerEffect on Widget {
//   Widget applyShimmer(
//       {bool enable = true, Color? baseColor, Color? highlightColor}) {
//     if (enable) {
//       return Shimmer.fromColors(
//         baseColor: baseColor == null ? Colors.grey.shade300 : baseColor,
//         highlightColor:
//             highlightColor == null ? Colors.grey.shade100 : highlightColor,
//         enabled: enable,
//         child: this,
//       );
//     } else {
//       return this;
//     }
//   }
// }