import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/manager/old_orders_cubit/old_orders_cubit.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../../home/presentation/view/widgets/custom_app_bar.dart';

class OldOrdersViewBody extends StatefulWidget {
  const OldOrdersViewBody({super.key});

  @override
  State<OldOrdersViewBody> createState() => _OldOrdersViewBodyState();
}

class _OldOrdersViewBodyState extends State<OldOrdersViewBody> {
  @override
  void initState() {
    BlocProvider.of<OldOrdersCubit>(context).getOldOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          VirticalSpace(1),
          CustomAppBar(
            logo: kLogo,
            image: appBarImage,
          ),
        ],
      ),
    );
  }
}
