import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../manager/login_cubit/login_cubit.dart';

class LoginInitialSection extends StatelessWidget {
  const LoginInitialSection({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.accessCubit,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final LoginCubit accessCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomElevatedButton(
        child: Text(
          AppStrings.sendTheCode.tr(),
          style: const TextStyle(color: Colors.black),
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            await accessCubit.createPhoneSession(
                phoneNumber: accessCubit.phone!);
          }
        },
      ),
    );
  }
}
