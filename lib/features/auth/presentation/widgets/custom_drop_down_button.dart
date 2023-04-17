import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/signup_cubit/signup_cubit.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    required this.items,
    required this.hintText,
  });

  final List items;
  final String hintText;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  var selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: DropdownButton(
        underline: const Divider(
          color: Colors.white,
          thickness: 0,
        ),
        isExpanded: true,
        value: selected,
        hint: Text(widget.hintText),
        items: widget.items
            .map(
              (e) => DropdownMenuItem(
                child: Text('$e'),
                value: e,
              ),
            )
            .toList(),
        onChanged: (index) {
          BlocProvider.of<SignupCubit>(context).selectAccount(selected: index);
          selected = index;
          setState(() {});
        },
      ),
    );
  }
}
