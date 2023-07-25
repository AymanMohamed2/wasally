import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vpn/flutter_vpn.dart';
import 'package:get/get.dart' hide Trans;
import 'package:onesignal_flutter/onesignal_flutter.dart';
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
          onTap: () async {
            // _getCurrentLocation();
            // await _pickImage().then((_) async {
            //   await createFile(fileName: fileName!, path: path!);
            // });
          },
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

  Future<void> sendNotification() async {
    await getPlayerId();

    await OneSignal.shared.postNotification(OSCreateNotification(
      playerIds: [],
      content: 'Hello, world!',
      heading: 'Test Notification',
    ));
  }

  Future<String?> getPlayerId() async {
    // Initialize OneSignal
    OneSignal.shared.setAppId("d3c7d9c5-9e70-48f0-891e-9d13208e8cba");

    // Get the player ID
    var status = await OneSignal.shared.getDeviceState();
    return status?.userId;
  }

  Future<void> connectToVpn() async {
    await FlutterVpn.prepare();

    await FlutterVpn.connectIkev2EAP(
      server: '20.254.71.10',
      username: 'Darknaya',
      password: 'Justoffring1',
      // other settings here
    );
  }

  Future<List<String>> getAllPlayerIds() async {
    var appId = "bba93b33-c5b7-4ffd-a9c7-84b8ee55feb7";
    var restApiKey = "ODkzZTY1MjktZjBlYy00NGFmLTg2YjUtYTgyY2ZkOTU2N2Q0";
    var headers = {"Authorization": "Basic $restApiKey"};

    var url = "https://onesignal.com/api/v1/players?app_id=$appId&limit=300";
    try {
      var response = await Dio().get(
        url,
        options: Options(headers: headers),
      );
      // ignore: avoid_print
      print('success');
      return response.data;
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }
  }

  // void _requestPermission() async {
  //   Location location = Location();

  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;

  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  // }

  // void _getCurrentLocation() async {
  //   Location location = Location();

  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;

  //   // Check and request permissions as shown in the previous step
  //   _requestPermission();
  //   LocationData locationData;
  //   try {
  //     locationData = await location.getLocation();
  //   } catch (e) {
  //     print("Error getting location: $e");
  //     return;
  //   }

  //   double latitude = locationData.latitude!;
  //   double longitude = locationData.longitude!;

  //   print("Latitude: $latitude, Longitude: $longitude");
  // }
}
