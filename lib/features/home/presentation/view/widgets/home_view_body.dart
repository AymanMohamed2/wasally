import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/space_widget.dart';
import 'package:wasally/features/home/presentation/manager/slider_cubit/slider_cubit.dart';
import '../../../../../core/utils/app_strings.dart';
import 'custom_app_bar.dart';
import 'custom_carousel.dart';
import 'custom_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  void initState() {
    BlocProvider.of<SliderCubit>(context).getSliderList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            icon: Icons.notifications,
            image: kLogo,
          ),
          const VirticalSpace(3),
          SizedBox(
              height: SizeConfig.screenHeight! * 0.2,
              width: double.infinity,
              child: const CustomCarousel()),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.defaultSize! * 2,
                top: SizeConfig.defaultSize! * 1,
                right: SizeConfig.defaultSize! * 2),
            child: Text(
              AppStrings.categories.tr(),
              style: TextStyle(
                  fontSize: SizeConfig.screenHeight! * 0.03,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gulzar'),
            ),
          ),
          const CustomGrideView(),
        ],
      ),
    );
  }
}
