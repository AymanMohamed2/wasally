import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/size_config.dart';
import '../../manager/pick_image_cubit/pick_image_cubit.dart';

class PickImageSuccessSection extends StatefulWidget {
  const PickImageSuccessSection({
    super.key,
  });

  @override
  State<PickImageSuccessSection> createState() =>
      _PickImageSuccessSectionState();
}

class _PickImageSuccessSectionState extends State<PickImageSuccessSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.04),
      child: InkWell(
        onTap: () async {
          await BlocProvider.of<PickImageCubit>(context).pickImage();
          setState(() {});
        },
        child: Container(
            width: double.infinity,
            height: SizeConfig.screenHeight! * 0.3,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Center(
              child: Image.file(
                  BlocProvider.of<PickImageCubit>(context).imageFile!),
            )),
      ),
    );
  }
}
