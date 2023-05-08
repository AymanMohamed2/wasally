import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../manager/login_cubit/login_cubit.dart';
import '../../manager/verify_cubit/verify_cubit.dart';

class VerifyInitialSection extends StatelessWidget {
  const VerifyInitialSection({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.accessCubit,
    required this.accessLoginCubit,
    required this.virifictionCode,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final VerifyCubit accessCubit;
  final LoginCubit accessLoginCubit;
  final String? virifictionCode;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      child: CustomText(
        text: AppStrings.verify.tr(),
        fontSize: 16,
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          accessCubit.confirmPhoneSession(
              userId: accessLoginCubit.loginModel!.userId,
              secret: virifictionCode!);
        }
      },
    );
  }
}
