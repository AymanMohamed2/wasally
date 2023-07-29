import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../core/functions/custom_error_snake_bar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../auth/presentation/manager/verify_cubit/verify_cubit.dart';
import '../../../../complete_order/presentation/manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import '../../../../curved_navigation_bar/presentation/view/curved_navigation_bar.dart';
import 'complete_order_failure_section.dart';
import 'complete_order_initial_section.dart';
import 'complete_order_loading_section.dart';
import 'complete_order_success_section.dart';

class BlocConsumerWasallyButton extends StatelessWidget {
  const BlocConsumerWasallyButton({
    super.key,
    required this.categoryName,
    required GlobalKey<FormState> formKey,
    required this.accessVerifyCubit,
    required this.title,
    required this.accessCubit,
    required TextEditingController controller,
  })  : _formKey = formKey,
        _controller = controller;

  final String categoryName;
  final GlobalKey<FormState> _formKey;
  final VerifyCubit accessVerifyCubit;
  final String title;
  final CompleteOrderCubit accessCubit;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteOrderCubit, CompleteOrderState>(
      builder: (context, state) {
        if (state is CompleteOrderLoading) {
          return const CompleteOrderLoadingSection();
        } else if (state is CompleteOrderSuccess) {
          return CompleteOrderSuccessSection(
              formKey: _formKey,
              accessVerifyCubit: accessVerifyCubit,
              categoryName: categoryName,
              title: title,
              accessCubit: accessCubit,
              controller: _controller);
        } else if (state is CompleteOrderFailure) {
          return CompleteOrderFailureSection(
              formKey: _formKey,
              accessVerifyCubit: accessVerifyCubit,
              categoryName: categoryName,
              title: title,
              accessCubit: accessCubit);
        } else {
          return CompleteOrderInitialSection(
              categoryName: categoryName,
              formKey: _formKey,
              accessVerifyCubit: accessVerifyCubit,
              title: title,
              accessCubit: accessCubit);
        }
      },
      listener: (context, state) async {
        if (state is CompleteOrderSuccess) {
          Get.off(() => BottomNavigationBarHome(
                selectedindex: 1,
              ));
          showSnakeBar(context, message: AppStrings.orderSendSuccessfuly.tr());
          try {
            await BlocProvider.of<CompleteOrderCubit>(context)
                .getPlayerIdsAndSendNotification();
          } on Exception catch (e) {
            // ignore: avoid_print
            print(e.toString());
          }
        } else if (state is CompleteOrderFailure) {
          showSnakeBar(context, message: '${state.errMessage}  ❌');
        } else if (state is UploadImageFailure) {
          showSnakeBar(context, message: AppStrings.errorUploadImage.tr());
        }
      },
    );
  }
}
