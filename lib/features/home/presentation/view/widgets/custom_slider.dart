import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';
import 'package:wasally/core/utils/app_colors.dart';
import 'package:wasally/core/utils/size_config.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key, required this.images});
  final List<dynamic> images;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    ScrollPageController scrollController = ScrollPageController();

    return SizedBox(
      height: SizeConfig.screenHeight! * 0.13,
      child: ScrollPageView(
        indicatorColor: AppColors.primaryColor,
        controller: scrollController,
        children: widget.images.map((image) => _imageView(image)).toList(),
      ),
    );
  }

  Widget _imageView(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
