import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:wasally/core/widgets/custom_text.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/language_manager.dart';

import '../../../../../core/utils/size_config.dart';

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
        fontSize: SizeConfig.screenHeight! * 0.02,
      ),
      value: selected,
      items: const [
        DropdownMenuItem(
          value: 'en',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('English'), Text('🇺🇸')],
          ),
        ),
        DropdownMenuItem(
            value: 'ar',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('العربية'),
                Text('🇪🇬'),
              ],
            )),
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
