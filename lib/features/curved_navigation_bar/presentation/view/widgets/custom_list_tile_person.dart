import 'package:flutter/material.dart';
import 'package:wasally/core/utils/size_config.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.title, required this.icon, this.onTap});

  final Widget title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight! * 0.1,
          width: double.infinity,
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.orange,
              size: SizeConfig.screenHeight! * 0.04,
            ),
            title: title,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
