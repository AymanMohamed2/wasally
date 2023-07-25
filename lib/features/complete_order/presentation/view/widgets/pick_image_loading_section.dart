import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/widgets/custom_loading_indicator.dart';

import '../../../../../core/utils/size_config.dart';
import '../../manager/pick_image_cubit/pick_image_cubit.dart';

class PickImageLoadingSection extends StatelessWidget {
  const PickImageLoadingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.04),
      child: InkWell(
        onTap: () async {
          await BlocProvider.of<PickImageCubit>(context).pickImage();
        },
        child: Container(
            width: double.infinity,
            height: SizeConfig.screenHeight! * 0.3,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: const Center(
              child: CustomLoadingIndicator(),
            )),
      ),
    );
  }
}
