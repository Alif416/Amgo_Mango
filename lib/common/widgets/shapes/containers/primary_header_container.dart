import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class MPrimaryHeaderContainer extends StatelessWidget {
  const MPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MCurvedEdgeWidget(
      child: Container(
        color: MColors.primary,

        /// -if ( size.infinite*: is not true in stack)error occurred -> read readme.md
        child: Stack(
          children: [
            /// -- background custom shapes
            Positioned(
                top: -150,
                right: -250,
                child: MCircularContainer(
                    backgroundColor: MColors.textWhite.withOpacity(0.1))),
            Positioned(
                top: 100,
                right: -300,
                child: MCircularContainer(
                    backgroundColor: MColors.textWhite.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}
