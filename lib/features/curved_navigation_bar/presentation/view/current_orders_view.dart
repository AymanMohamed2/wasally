import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/current_orders_view_body.dart';

import '../../../../core/utils/api_services.dart';
import '../../data/repositories/curved_navigation_bar_repo/curved_navigation_bar_repo_impl.dart';
import '../manager/get_current_orders_cubit/get_current_orders_cubit.dart';

class CurrentOrdersView extends StatelessWidget {
  const CurrentOrdersView({super.key, this.phoneNumber});
  final String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //     create: (context) => DeleteOrderCubit(
        //         CurvedNavigationBarRepoImpl(ApiServices(Dio())))),
        BlocProvider(
          create: (context) => GetCurrentOrdersCubit(
            CurvedNavigationBarRepoImpl(ApiServices(Dio())),
          )
            ..getCurrentOrders()
            ..getCurrentOrdersStream(),
        ),
      ],
      child: const Scaffold(
        body: CurrentOrdersViewBody(),
      ),
    );
  }
}
