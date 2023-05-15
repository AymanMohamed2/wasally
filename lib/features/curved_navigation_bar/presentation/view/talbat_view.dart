import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/talbat_view_body.dart';

import '../../../../core/utils/api_services.dart';
import '../../data/repositories/curved_navigation_bar_repo/curved_navigation_bar_repo_impl.dart';
import '../manager/delete_order_cubit/delete_order_cubit.dart';

class TalbatView extends StatelessWidget {
  const TalbatView({super.key, this.phoneNumber});
  final String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => DeleteOrderCubit(
                CurvedNavigationBarRepoImpl(ApiServices(Dio())))),
      ],
      child: const Scaffold(
        body: TalbatViewBody(),
      ),
    );
  }
}
