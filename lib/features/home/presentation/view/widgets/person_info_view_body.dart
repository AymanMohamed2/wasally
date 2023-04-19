import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:wasally/features/auth/presentation/view/login_view.dart';

import 'custom_list_tile_person.dart';

class PersonInfoViewBody extends StatelessWidget {
  const PersonInfoViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessCubit = BlocProvider.of<LoginCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text(
                  'accessCubit.accountInfo!.name',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  'accessCubit.accountInfo!.email',
                  style: TextStyle(color: Colors.black),
                ),
                decoration: BoxDecoration(color: Colors.orange),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.orange,
                  ),
                ),
              ),
              CustomListTile(
                title: 'Contact us',
                icon: Icons.chat,
              ),
              CustomListTile(
                title: 'General settings',
                icon: Icons.settings,
              ),
              CustomListTile(
                title: 'Share the app',
                icon: Icons.share,
              ),
              CustomListTile(
                title: 'Logout',
                icon: Icons.logout,
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.remove("email");
                  pref.remove("password");
                  Get.off(() => const LoginView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
