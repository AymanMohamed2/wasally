import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/core/widgets/custom_loading_indicator.dart';

import 'package:wasally/features/auth/presentation/view/login_view.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/manager/person_cubit/person_cubit.dart';
import 'package:easy_localization/easy_localization.dart' ;
import '../../../../../core/constants.dart';
import '../../../../../core/functions/custom_alert_dialog.dart';
import '../../../../../core/utils/app_strings.dart';
import 'custom_list_tile_person.dart';
import 'package:get/get.dart' hide Trans;

class PersonInfoViewBody extends StatelessWidget {
  const PersonInfoViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<PersonCubit, PersonState>(
            builder: (context, state) {
              if (state is PersonSuccess) {
                return ListView(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text(
                        state.userInfo.name ?? '',
                        style: const TextStyle(color: Colors.black),
                      ),
                      accountEmail: Text(
                        state.userInfo.phone ?? '',
                        style: const TextStyle(color: Colors.black),
                      ),
                      decoration: const BoxDecoration(color: Colors.orange),
                      currentAccountPicture: const CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    CustomListTile(
                      title:AppStrings.contactUs.tr(),
                      icon: Icons.chat,
                    ),
                     CustomListTile(
                      title: AppStrings.generalSettings.tr(),
                      icon: Icons.settings,
                    ),
                     CustomListTile(
                      title: AppStrings.shareApp.tr(),
                      icon: Icons.share,
                    ),
                    CustomListTile(
                      title: AppStrings.logout.tr(),
                      icon: Icons.logout,
                      onTap: () async {
                        customAlertDialog(context,
                            cancelBtnColor: Colors.black,
                            title: AppStrings.areYouSure.tr(),
                            text:AppStrings.toLogOut.tr(),
                            
                            type: CoolAlertType.confirm,
                            onConfirmBtnTap: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.remove("email");
                          pref.remove("password");
                          pref.remove('userId');
                          Get.off(() => const LoginView());
                        }, onCancelBtnTap: () {});
                      },
                    ),
                  ],
                );
              } else if (state is PersonFailure) {
                return Text(state.errMessage);
              } else {
                return const CustomLoadingIndicator(
                  color: kPrimaryColor,
                  height: 25,
                  width: 25,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
