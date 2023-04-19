import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/signup_cubit/signup_cubit.dart';

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
          return 'this field is required';
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
