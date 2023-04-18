import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/home/presentation/manager/slider_cubit/slider_cubit.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        if (state is SliderStateLoading) {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        } else if (state is SliderStateSuccess) {
          return CarouselSlider(
            options: CarouselOptions(
              height: SizeConfig.defaultSize! * 20,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: state.sliderList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: i,
                      ));
                },
              );
            }).toList(),
          );
        } else if (state is SliderStateFailure) {
          return CarouselSlider(
            options: CarouselOptions(
              height: SizeConfig.defaultSize! * 20,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: [
              state.errMessage,
              state.errMessage,
              state.errMessage,
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Center(
                      child: Text(i),
                    ),
                  );
                },
              );
            }).toList(),
          );
        } else {
          return CarouselSlider(
            options: CarouselOptions(
              height: SizeConfig.defaultSize! * 20,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: [
              'Something went wrong'
                  'Something went wrong'
                  'Something went wrong'
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Center(
                      child: Text(i),
                    ),
                  );
                },
              );
            }).toList(),
          );
        }
      },
    );
  }
}
