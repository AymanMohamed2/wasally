import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/widgets/space_widget.dart';
import 'package:wasally/features/home/presentation/manager/slider_cubit/slider_cubit.dart';

import '../manager/categories_cubit/home_cubit.dart';
import 'custom_app_bar.dart';
import 'custom_carousel.dart';
import 'custom_grid_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  void initState() {
    BlocProvider.of<CategoriesCubit>(context).getCategories();
    BlocProvider.of<SliderCubit>(context).getSliderList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(
            icon: Icons.notifications,
            image: kLogo,
          ),
          VirticalSpace(3),
          CustomCarousel(),
          Padding(
            padding: EdgeInsets.only(left: 8, top: 10),
            child: Text(
              'Categories',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gulzar'),
            ),
          ),
          CustomGrideView(),
        ],
      ),
    );
  }
}
