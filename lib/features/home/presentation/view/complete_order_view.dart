import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/functions/custom_alert_dialog.dart';
import 'package:wasally/core/utils/app_strings.dart';
import 'package:wasally/features/home/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';
import 'package:wasally/features/home/presentation/view/widgets/complete_order_failure_section.dart';
import 'package:wasally/features/home/presentation/view/widgets/complete_order_initial_section.dart';
import 'package:wasally/features/home/presentation/view/widgets/complete_order_loading_section.dart';
import 'package:wasally/features/home/presentation/view/widgets/complete_order_success_section.dart';
import 'package:wasally/features/home/presentation/view/widgets/complete_order_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import '../../../auth/presentation/manager/verify_cubit/verify_cubit.dart';
import '../../../curved_navigation_bar/presentation/view/curved_navigation_bar.dart';
import '../manager/complete_order_button_cubit/complete_order_button_cubit.dart';

class CompleteOrderView extends StatelessWidget {
  CompleteOrderView({
    super.key,
    required this.title,
    required this.imageUrl,
  });
  final String title;
  final String imageUrl;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var accessCubit = BlocProvider.of<CompleteOrderCubit>(context);
    var accessVerifyCubit = BlocProvider.of<VerifyCubit>(context);

    return BlocProvider(
      create: (context) => CompleteOrderGetLocationCubit(),
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: [CachedNetworkImage(imageUrl: imageUrl)],
            title: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          floatingActionButton:
              BlocConsumer<CompleteOrderCubit, CompleteOrderState>(
                  builder: (context, state) {
            if (state is CompleteOrderInitial) {
              return CompleteOrderInitialSection(
                  categoryName: title,
                  formKey: _formKey,
                  accessVerifyCubit: accessVerifyCubit,
                  title: title,
                  accessCubit: accessCubit);
            } else if (state is CompleteOrderSuccess) {
              return CompleteOrderSuccessSection(
                  formKey: _formKey,
                  accessVerifyCubit: accessVerifyCubit,
                  categoryName: title,
                  title: title,
                  accessCubit: accessCubit,
                  controller: _controller);
            } else if (state is CompleteOrderFailure) {
              return CompleteOrderFailureSection(
                  formKey: _formKey,
                  accessVerifyCubit: accessVerifyCubit,
                  categoryName: title,
                  title: title,
                  accessCubit: accessCubit);
            } else {
              return const CompleteOrderLoadingSection();
            }
          }, listener: (context, state) {
            if (state is CompleteOrderSuccess) {
              Get.off(() => BottomNavigationBarHome(
                    selectedindex: 1,
                  ));
              showSnakeBar(context,
                  message: AppStrings.orderSendSuccessfuly.tr());
            } else if (state is CompleteOrderFailure) {
              showSnakeBar(context, message: '${state.errMessage}  ❌');
            }
          }),
          body: CompleteOrderViewBody(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
