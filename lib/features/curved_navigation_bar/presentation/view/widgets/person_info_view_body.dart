import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/utils/language_manager.dart';
import 'package:wasally/features/auth/presentation/manager/verify_cubit/verify_cubit.dart';

import 'package:wasally/features/auth/presentation/view/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/functions/custom_alert_dialog.dart';
import '../../../../../core/utils/app_strings.dart';
import 'custom_drop_down_button.dart';
import 'custom_list_tile_person.dart';
import 'package:get/get.dart' hide Trans;

class PersonInfoViewBody extends StatefulWidget {
  const PersonInfoViewBody({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonInfoViewBody> createState() => _PersonInfoViewBodyState();
}

class _PersonInfoViewBodyState extends State<PersonInfoViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text(
                  '',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  BlocProvider.of<VerifyCubit>(context).userInfoModel?.phone ??
                      '',
                  style: const TextStyle(color: Colors.black),
                ),
                decoration: const BoxDecoration(color: kPrimaryColor),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.orange,
                  ),
                ),
              ),
              const CustomListTile(
                title: CustomDropDownButton(),
                icon: Icons.language,
              ),
              CustomListTile(
                title: Text(AppStrings.contactUs.tr()),
                icon: Icons.chat,
                onTap: () async {
                  String text = "Hello World !! Hey There";
                  String url =
                      "https://www.facebook.com/profile.php?id=100072411852468";
                  await launchUrl(Uri.parse(url),
                      mode: LaunchMode.externalNonBrowserApplication);
                },
              ),
              CustomListTile(
                title: Text(AppStrings.shareApp.tr()),
                icon: Icons.share,
              ),
              CustomListTile(
                title: Text(AppStrings.logout.tr()),
                icon: Icons.logout,
                onTap: () async {
                  customAlertDialog(context,
                      cancelBtnColor: Colors.black,
                      title: AppStrings.areYouSure.tr(),
                      text: AppStrings.toLogOut.tr(),
                      type: CoolAlertType.confirm, onConfirmBtnTap: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.remove('userId');
                    Get.off(() => const LoginView());
                  }, onCancelBtnTap: () {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
