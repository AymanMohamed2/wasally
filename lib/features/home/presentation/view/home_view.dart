import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/home/presentation/manager/slider_cubit/slider_cubit.dart';

import 'package:wasally/features/home/presentation/view/widgets/home_view_body.dart';

import '../../../../core/utils/size_config.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: BlocBuilder<SliderCubit, SliderState>(
        builder: (context, state) {
          return const HomeViewBody();
        },
      ),
    );
  }
}
