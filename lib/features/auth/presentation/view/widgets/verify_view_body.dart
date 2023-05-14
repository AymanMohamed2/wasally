import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' hide Trans;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:wasally/features/auth/presentation/manager/verify_cubit/verify_cubit.dart';
import 'package:wasally/features/auth/presentation/view/widgets/verify_initial_section.dart';
import 'package:wasally/features/auth/presentation/view/widgets/verify_loading_section.dart';
import 'package:wasally/features/auth/presentation/view/widgets/verify_section.dart';
import 'package:wasally/features/splash/presentation/manager/splash_cubit/splash_cubit.dart';
import '../../../../../core/functions/custom_alert_dialog.dart';
import '../../../../curved_navigation_bar/presentation/view/curved_navigation_bar.dart';
import 'custom_edit_phone_number.dart';

class VerifyViewBody extends StatelessWidget {
  const VerifyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCubit accessCubit = BlocProvider.of<VerifyCubit>(context);
    LoginCubit accessLoginCubit = BlocProvider.of<LoginCubit>(context);
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        margin: EdgeInsets.only(
            left: SizeConfig.screenWidth! * 0.07,
            right: SizeConfig.screenWidth! * 0.07),
        child: SingleChildScrollView(
          child: Column(
            children: [
              VerifySection(
                accessCubit: accessCubit,
                accessLoginCubit: accessLoginCubit,
                formKey: formKey,
              ),
              SizedBox(
                width: double.infinity,
                child: BlocConsumer<VerifyCubit, VerifyState>(
                  listener: (context, state) async {
                    if (state is VerifySuccess) {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.getString("phoneNumber");

                      await pref.setString(
                          'userId', accessCubit.userInfoModel!.id!);
                      BlocProvider.of<SplashCubit>(context).userId =
                          state.loginModel.userId!;
                      await pref.setString(
                          'phoneNumber', accessCubit.userInfoModel!.phone!);
                      Get.off(() => BottomNavigationBarHome());
                    } else if (state is VerifyFailure) {
                      showSnakeBar(context, message: '${state.errMessage}  ❌');
                    }
                  },
                  builder: (context, state) {
                    if (state is VerifyLoading) {
                      return const VerifyLoadingSection();
                    } else {
                      return VerifyInitialSection(
                        formKey: formKey,
                        accessCubit: accessCubit,
                        accessLoginCubit: accessLoginCubit,
                        virifictionCode: accessCubit.virifictionCode,
                      );
                    }
                  },
                ),
              ),
              const CustomEditPhoneNumber()
            ],
          ),
        ),
      ),
    );
  }
}
