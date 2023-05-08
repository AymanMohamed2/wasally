import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:wasally/core/widgets/custom_text.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/language_manager.dart';
import 'package:get/get.dart' hide Trans;


class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    String? selected;
    return DropdownButton(
      isExpanded: true,
      underline: const Divider(
        thickness: 0.0,
      ),
      hint: CustomText(
        text: AppStrings.language.tr(),
        color: Colors.black,
        fontSize: 16,
      ),
      value: selected,
      items: const [
        DropdownMenuItem(
          value: 'en',
          child: Text('English'),
        ),
        DropdownMenuItem(
          value: 'ar',
          child: Text('العربية'),
        ),
      ],
      onChanged: (String? value) {
        setState(() {
          selected = value;
          _switchLanguage(context, value: value!);
        });
      },
    );
  }

  void _switchLanguage(BuildContext context, {required String value}) async {
    Locale newLocale = value == 'en' ? englishLocal : arabicLocal;
    context.setLocale(newLocale);

    Phoenix.rebirth(context);
  }
}
