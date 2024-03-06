import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/complete_order/presentation/manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/custom_product_list_view.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/custom_text_menu.dart';

class MenuAndImagePickerBuilder extends StatelessWidget {
  const MenuAndImagePickerBuilder({
    super.key,
    required this.catigoryName,
  });

  final String catigoryName;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if ((catigoryName == 'Restaurant' || catigoryName == 'مطعم') &&
          BlocProvider.of<CompleteOrderCubit>(context)
                  .document!
                  .shopCategories!
                  .length !=
              0) {
        return const Expanded(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextMenu(),
                CustomProductListView(),
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
