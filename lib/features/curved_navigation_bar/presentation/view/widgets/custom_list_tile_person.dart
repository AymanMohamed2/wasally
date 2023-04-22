import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.title, required this.icon, this.onTap});

  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: Colors.orange,
            size: 30,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
          onTap: onTap,
        ),
        const Divider(
          color: Colors.orange,
          thickness: 1,
        ),
      ],
    );
  }
}
