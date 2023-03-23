import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
  });

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
        hint: const Text('Please Choose Account Type'),
        items: ['Buiseness Account', 'User Account']
            .map(
              (e) => DropdownMenuItem(
                child: Text('$e'),
                value: e,
              ),
            )
            .toList(),
        onChanged: (index) {
          selected = index;
          setState(() {});
        },
      ),
    );
  }
}