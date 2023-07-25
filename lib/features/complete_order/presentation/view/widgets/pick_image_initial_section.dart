import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../manager/pick_image_cubit/pick_image_cubit.dart';

class PickImageInitialSection extends StatelessWidget {
  const PickImageInitialSection({
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                size: 50,
                Icons.add_a_photo,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: AppStrings.chooseAPhotoFromGallery.tr(),
                fontSize: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
