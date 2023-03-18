import 'package:flutter/material.dart';
import 'package:wasally/core/widgets/costum_text_field.dart';

import '../../../../../core/widgets/custom_buttons.dart';

class CompleteOrderViewBody extends StatelessWidget {
  const CompleteOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: const Card(
            child: CustomTextField(
              hintText: 'Write Your Order',
              minLines: 10,
              maxLines: 15,
            ),
          ),
        ),
        CustomButtonGetPosition(
          onTap: () {},
        )
      ],
    );
  }
}
