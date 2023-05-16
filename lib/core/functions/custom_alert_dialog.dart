import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

void customAlertDialog(
  BuildContext context, {
  required String title,
  required String text,
  required CoolAlertType type,
  void Function()? onConfirmBtnTap,
  void Function()? onCancelBtnTap,
  Color? cancelBtnColor,
  bool showCancelBtn = true,
}) {
  CoolAlert.show(
    cancelBtnTextStyle: TextStyle(color: cancelBtnColor),
    showCancelBtn: showCancelBtn,
    onCancelBtnTap: onCancelBtnTap,
    onConfirmBtnTap: onConfirmBtnTap,
    title: title,
    confirmBtnColor: kPrimaryColor,
    confirmBtnTextStyle: const TextStyle(color: Colors.black),
    context: context,
    type: type,
    text: text,
  );
}

void showSnakeBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
