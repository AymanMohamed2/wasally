import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CustomImageViewer extends StatelessWidget {
  const CustomImageViewer({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoView(
          imageProvider:
              NetworkImage(imageUrl), // You can use FileImage for local images.
          heroAttributes: PhotoViewHeroAttributes(
              tag: imageUrl), // For hero animation (optional).
        ),
      ),
    );
  }
}
