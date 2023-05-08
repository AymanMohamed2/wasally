import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../../auth/presentation/manager/verify_cubit/verify_cubit.dart';

class PersonHeaderSection extends StatelessWidget {
  const PersonHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: const Text(
        '',
        style: TextStyle(color: Colors.black),
      ),
      accountEmail: Text(
        BlocProvider.of<VerifyCubit>(context).userInfoModel?.phone ?? '',
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
    );
  }
}
