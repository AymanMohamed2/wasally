import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/networking/api_services.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/space_widget.dart';
import 'package:wasally/features/home/data/repositories/home_repo.dart';
import 'package:wasally/features/home/data/repositories/home_repo_impl.dart';
import 'package:wasally/features/home/presentation/manager/slider_cubit/slider_cubit.dart';
import '../../../../../core/functions/custom_alert_dialog.dart';
import '../../../../../core/utils/app_strings.dart';
import 'custom_app_bar.dart';
import 'custom_carousel.dart';
import 'custom_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  HomeRepo homeRepo = HomeRepoImpl(ApiServices(Dio()));
  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  void initState() {
    BlocProvider.of<SliderCubit>(context).getNewVersion().then((_) {
      getAppVersion().then((currentVersion) {
        if (BlocProvider.of<SliderCubit>(context).newVersion !=
            currentVersion) {
          customAlertDialog(context, onConfirmBtnTap: () async {
            String url =
                "https://play.google.com/store/apps/details?id=com.darknaya.wasally";
            await launchUrl(Uri.parse(url),
                mode: LaunchMode.externalNonBrowserApplication);
          },
              confirmText: AppStrings.update.tr(),
              title: AppStrings.update.tr(),
              text: AppStrings.thereWasANewUpdate.tr(),
              type: CoolAlertType.info);
        }
      });
    });

    super.initState();
    BlocProvider.of<SliderCubit>(context).getSliderList();
    BlocProvider.of<SliderCubit>(context).getSliderListStream();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VirticalSpace(1),
          const CustomAppBar(
            logo: kLogo,
            image: appBarImage,
          ),
          const VirticalSpace(3),
          SizedBox(
              height: SizeConfig.screenHeight! * 0.2,
              width: double.infinity,
              child: const CustomCarousel()),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.defaultSize! * 2,
                top: SizeConfig.defaultSize! * 1,
                right: SizeConfig.defaultSize! * 2),
            child: Text(
              AppStrings.categories.tr(),
              style: TextStyle(
                  fontSize: SizeConfig.screenHeight! * 0.03,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gulzar'),
            ),
          ),
          const CustomGrideView(),
        ],
      ),
    );
  }
}
