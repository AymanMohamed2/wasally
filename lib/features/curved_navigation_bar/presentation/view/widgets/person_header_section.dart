import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/core/utils/size_config.dart';

import '../../../../../core/constants.dart';

class PersonHeaderSection extends StatefulWidget {
  const PersonHeaderSection({super.key});

  @override
  State<PersonHeaderSection> createState() => _PersonHeaderSectionState();
}

class _PersonHeaderSectionState extends State<PersonHeaderSection> {
  String? phoneNumber;
  Future<String> nameRetriever() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('phoneNumber')!;
  }

  @override
  void initState() {
    nameRetriever().then((value) {
      setState(() {
        phoneNumber = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.25,
      child: UserAccountsDrawerHeader(
        currentAccountPictureSize: Size.square(SizeConfig.screenHeight! * 0.1),
        accountName: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        accountEmail: Text(
          phoneNumber ?? '',
          style: TextStyle(
              color: Colors.black, fontSize: SizeConfig.screenHeight! * 0.02),
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
    );
  }
}
