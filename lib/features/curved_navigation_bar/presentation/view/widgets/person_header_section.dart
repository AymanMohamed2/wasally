import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/utils/size_config.dart';

import '../../../../../core/constants.dart';
import '../../../../auth/presentation/manager/verify_cubit/verify_cubit.dart';

class PersonHeaderSection extends StatelessWidget {
  const PersonHeaderSection({super.key});

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
          BlocProvider.of<VerifyCubit>(context).userInfoModel?.phone ?? '',
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
