import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/widgets/costum_text_field.dart';

import '../../../../../core/widgets/custom_buttons.dart';
import '../../manager/complete_order_cubit/complete_order_cubit.dart';

class CompleteOrderViewBody extends StatelessWidget {
  const CompleteOrderViewBody({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    var accessCubit = BlocProvider.of<CompleteOrderCubit>(context);
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Card(
            child: CustomTextField(
              textInputType: TextInputType.text,
              controller: controller,
              onChanged: (value) {
                accessCubit.order = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Order';
                } else {
                  return null;
                }
              },
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
