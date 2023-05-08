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
import '../../../../curved_navigation_bar/presentation/view/curved_navigation_bar.dart';
import 'custom_edit_phone_number.dart';

class VerifyViewBody extends StatelessWidget {
  const VerifyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCubit accessCubit = BlocProvider.of<VerifyCubit>(context);
    LoginCubit accessLoginCubit = BlocProvider.of<LoginCubit>(context);
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
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
                formKey: _formKey,
              ),
              SizedBox(
                width: double.infinity,
                child: BlocConsumer<VerifyCubit, VerifyState>(
                  listener: (context, state) async {
                    if (state is VerifySuccess) {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      await pref.setString(
                          'userId', accessCubit.userInfoModel!.id!);
                      BlocProvider.of<SplashCubit>(context).userId =
                          state.loginModel.userId!;
                      Get.off(() => const BottomNavigationBarHome());
                    } else if (state is VerifyFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 2),
                          content: Text(state.errMessage),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is VerifyLoading) {
                      return const VerifyLoadingSection();
                    } else {
                      return VerifyInitialSection(
                        formKey: _formKey,
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
