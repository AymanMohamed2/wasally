import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/dependncy_injection/service_locator.dart';
import 'package:wasally/features/curved_navigation_bar/data/repositories/curved_navigation_bar_repo/curved_navigation_bar_repo_impl.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/manager/old_orders_cubit/old_orders_cubit.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/old_orders_view_body.dart';

class OldOrdersView extends StatelessWidget {
  const OldOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OldOrdersCubit(getIt.get<CurvedNavigationBarRepoImpl>())
            ..getOldOrders(),
      child: const Scaffold(
        body: OldOrdersViewBody(),
      ),
    );
  }
}
