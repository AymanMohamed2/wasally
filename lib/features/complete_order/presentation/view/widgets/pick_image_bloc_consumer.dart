import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/complete_order/presentation/manager/pick_image_cubit/pick_image_cubit.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/pick_image_initial_section.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/pick_image_loading_section.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/pick_image_success_section.dart';

class PickImageBlocConsumer extends StatelessWidget {
  const PickImageBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PickImageCubit, PickImageState>(
      listener: (context, state) {
        if (state is PickImageSuccess) {}
      },
      builder: (context, state) {
        if (state is PickImageSuccess) {
          return const PickImageSuccessSection();
        } else if (state is PickImageLoading) {
          return const PickImageLoadingSection();
        } else {
          return const PickImageInitialSection();
        }
      },
    );
  }
}
