import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wasally/core/widgets/custom_loading_indicator.dart';

class CustomImageViewer extends StatelessWidget {
  const CustomImageViewer({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoView(
          loadingBuilder: (context, event) {
            return const Center(child: CustomLoadingIndicator());
          },
          imageProvider:
              NetworkImage(imageUrl), // You can use FileImage for local images.
          heroAttributes: PhotoViewHeroAttributes(
              tag: imageUrl), // For hero animation (optional).
        ),
      ),
    );
  }
}
