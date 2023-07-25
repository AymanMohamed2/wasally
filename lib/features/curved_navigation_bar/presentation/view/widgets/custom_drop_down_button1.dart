import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class CustomDropDownButton1 extends StatefulWidget {
  const CustomDropDownButton1({
    super.key,
    required this.items,
    required this.hintText,
    this.validator,
    required this.onChanged,
  });

  final List items;
  final String hintText;
  final String? Function(Object?)? validator;
  final Function(Object?)? onChanged;

  @override
  State<CustomDropDownButton1> createState() => _CustomDropDownButton1State();
}

class _CustomDropDownButton1State extends State<CustomDropDownButton1> {
  // ignore: prefer_typing_uninitialized_variables
  var selected;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(color: Colors.grey),
        label: Text(widget.hintText),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        focusedErrorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      validator: (value) {
        if (value == null) {
          return AppStrings.fieldRequired.tr();
        } else {
          return null;
        }
      },
      isExpanded: true,
      value: selected,
      items: widget.items
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text('$e'),
            ),
          )
          .toList(),
      onChanged: widget.onChanged,
    );
  }
}
