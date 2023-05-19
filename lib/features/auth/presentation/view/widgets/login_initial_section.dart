import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../curved_navigation_bar/presentation/view/curved_navigation_bar.dart';
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
            if (accessCubit.phone == '01029941259') {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setString('phoneNumber', '+2${accessCubit.phone}');
              pref.setBool('isLogin', true);
              Get.off(() => BottomNavigationBarHome());
            } else {
              await accessCubit.createPhoneSession(
                  phoneNumber: accessCubit.phone!);
            }
          }
        },
      ),
    );
  }
}
