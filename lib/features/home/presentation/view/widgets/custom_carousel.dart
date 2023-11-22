import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/themes/app_colors.dart';
import 'package:wasally/core/utils/app_strings.dart';
import 'package:wasally/features/home/presentation/manager/slider_cubit/slider_cubit.dart';
import 'package:wasally/features/home/presentation/view/widgets/custom_slider.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        if (state is SliderStateLoading) {
          return SizedBox(
            height: SizeConfig.screenHeight! * 0.13,
            child: Center(
              child: CustomLoadingIndicator(
                height: SizeConfig.screenHeight! * 0.04,
                width: SizeConfig.screenWidth! * 0.04,
                color: AppColors.primaryColor,
              ),
            ),
          );
        } else if (state is SliderStateSuccess) {
          return CustomSlider(
            images: state.sliderList,
          );
        } else if (state is SliderStateFailure) {
          return Center(
            child: SizedBox(
                height: SizeConfig.screenHeight! * 0.13,
                child: Text(state.errMessage)),
          );
        } else {
          return SizedBox(
            height: SizeConfig.screenHeight! * 0.13,
            child: Text(AppStrings.someThingWentWrong.tr()),
          );
        }
      },
    );
  }
}
