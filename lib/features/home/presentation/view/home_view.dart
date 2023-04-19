import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/features/home/presentation/manager/category_details_cubit/category_details_cubit.dart';

import 'package:wasally/features/home/presentation/view/widgets/home_view_body.dart';

import '../../../../core/utils/size_config.dart';
import '../manager/categories_cubit/home_cubit.dart';
import '../manager/slider_cubit/slider_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoriesCubit(
              ApiServices(),
            ),
          ),
          BlocProvider(
            create: (context) => SliderCubit(
              ApiServices(),
            ),
          ),
          BlocProvider(
            create: (context) => CategoryDetailsCubit(
              ApiServices(),
            ),
          ),
        ],
        child: const HomeViewBody(),
      ),
    );
  }
}
