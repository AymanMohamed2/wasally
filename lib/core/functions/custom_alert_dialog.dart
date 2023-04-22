import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

void customAlertDialog(BuildContext context,
    {required String title,
    required String text,
    required CoolAlertType type}) {
  CoolAlert.show(
    title: title,
    autoCloseDuration: const Duration(seconds: 4),
    confirmBtnColor: kPrimaryColor,
    confirmBtnTextStyle: const TextStyle(color: Colors.black),
    context: context,
    type: type,
    text: text,
  );
}
