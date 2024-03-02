import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator(
      {super.key,
      this.height = 15,
      this.width = 15,
      this.color = Colors.black});
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: LoadingAnimationWidget.inkDrop(
        color: color,
        size: height,
      ),
    );
  }
}
