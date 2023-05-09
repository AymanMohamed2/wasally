import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../manager/login_cubit/login_cubit.dart';
import '../../manager/verify_cubit/verify_cubit.dart';

class VerifySection extends StatelessWidget {
  const VerifySection(
      {super.key,
      required this.accessCubit,
      required this.accessLoginCubit,
      required GlobalKey<FormState> formKey})
      : _formKey = formKey;
  final VerifyCubit accessCubit;
  final LoginCubit accessLoginCubit;
  final GlobalKey<FormState> _formKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VirticalSpace(15),
        Image.asset(
          kLogo,
          width: SizeConfig.screenWidth! * 0.5,
          height: SizeConfig.screenHeight! * 0.2,
        ),
        const VirticalSpace(2.5),
        CustomText(
          text: AppStrings.verifyCode.tr(),
          fontSize: SizeConfig.screenHeight! * 0.03,
          fontWeight: FontWeight.bold,
        ),
        const VirticalSpace(1.1),
        CustomText(
          text: AppStrings.subTitleVerificton.tr(),
          fontSize: SizeConfig.screenHeight! * 0.02,
          textAlign: TextAlign.center,
        ),
        const VirticalSpace(3.2),
        SizedBox(
          width: double.infinity,
          child: Pinput(
            length: 6,
            showCursor: true,
            onCompleted: (value) {
              accessCubit.virifictionCode = value;
              if (_formKey.currentState!.validate()) {
                accessCubit.confirmPhoneSession(
                    userId: accessLoginCubit.loginModel!.userId, secret: value);
              }
            },
            validator: (value) {
              if (value != null && value.length < 6) {
                return AppStrings.completeVerifyErrMessage.tr();
              } else {
                return null;
              }
            },
          ),
        ),
        const VirticalSpace(2.2),
      ],
    );
  }
}
