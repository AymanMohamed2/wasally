import 'package:cool_alert/cool_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/custom_text.dart';
import '../../../../../core/functions/custom_alert_dialog.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../auth/presentation/view/login_view.dart';
import 'custom_drop_down_button.dart';
import 'custom_list_tile_person.dart';

class PersonBodySection extends StatefulWidget {
  const PersonBodySection({super.key});

  @override
  State<PersonBodySection> createState() => _PersonBodySectionState();
}

class _PersonBodySectionState extends State<PersonBodySection> {
  String? fileName;
  String? path;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomListTile(
          title: CustomDropDownButton(),
          icon: Icons.language,
        ),
        CustomListTile(
          title: CustomText(
            text: AppStrings.contactUs.tr(),
            fontSize: SizeConfig.screenHeight! * 0.02,
          ),
          icon: Icons.chat,
          onTap: () async {
            String url =
                "https://www.facebook.com/profile.php?id=100072411852468";
            await launchUrl(Uri.parse(url),
                mode: LaunchMode.externalNonBrowserApplication);
          },
        ),
        CustomListTile(
          onTap: () async {},
          title: CustomText(
              text: AppStrings.shareApp.tr(),
              fontSize: SizeConfig.screenHeight! * 0.02),
          icon: Icons.share,
        ),
        CustomListTile(
          title: CustomText(
              text: AppStrings.logout.tr(),
              fontSize: SizeConfig.screenHeight! * 0.02),
          icon: Icons.logout,
          onTap: () async {
            customAlertDialog(context,
                cancelBtnColor: Colors.black,
                title: AppStrings.areYouSure.tr(),
                text: AppStrings.toLogOut.tr(),
                type: CoolAlertType.confirm, onConfirmBtnTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.remove('userId');

              pref.remove('phoneNumber');
              pref.setBool('isLogin', false);
              Get.off(() => const LoginView());
            }, onCancelBtnTap: () {});
          },
        ),
      ],
    );
  }
}
