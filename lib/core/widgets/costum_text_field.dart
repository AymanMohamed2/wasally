import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.prefixIcon,
      this.obscureText = false,
      this.textInputType,
      this.suffixIcon,
      this.maxLines = 1,
      this.minLines = 1,
      this.onChanged,
      this.validator,
      this.errorMaxLines})
      : super(key: key);
  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? errorMaxLines;

  final bool obscureText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    final FocusNode myFocusNode = FocusNode();

    return TextFormField(
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: myFocusNode,
      validator: validator,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      obscureText: obscureText,
      cursorColor: Colors.orange,
      decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(color: Colors.black),
          label: Text(hintText),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconColor: Colors.orange,
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          errorMaxLines: errorMaxLines),
      keyboardType: textInputType,
    );
  }
}
