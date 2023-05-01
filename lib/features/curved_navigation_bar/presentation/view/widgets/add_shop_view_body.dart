import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:get/get.dart' hide Trans;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/core/constants.dart';
import 'package:wasally/core/utils/app_strings.dart';
import 'package:wasally/features/auth/presentation/manager/verify_cubit/verify_cubit.dart';
import 'package:wasally/features/auth/presentation/view/login_view.dart';
import 'package:wasally/core/widgets/custom_elevated_button.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/space_widget.dart';
import 'buiseness_section.dart';
import '../../manager/add_shop_cubit/add_shop_cubit.dart';

class AddShopViewBody extends StatelessWidget {
  AddShopViewBody({
    super.key,
  });
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AddShopCubit accessCubit = BlocProvider.of<AddShopCubit>(context);
    VerifyCubit accessVerifyCubit = BlocProvider.of<VerifyCubit>(context);

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 2.5),
        child: ListView(
          children: [
            Image.asset(
              kLogo,
              height: SizeConfig.defaultSize! * 10,
            ),
            const VirticalSpace(1),
            const BuisenessSection(),
            const VirticalSpace(3),
            BlocConsumer<AddShopCubit, AddShopState>(
              listener: (context, state) {
                if (state is AddShopSuccess) {
                  Get.back();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 2),
                      content: Text(AppStrings.shopCreated.tr()),
                    ),
                  );
                } else if (state is AddShopFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 2),
                      content: Text(state.errMessage),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AddShopLoading) {
                  return const CustomElevatedButton(
                    child: CustomLoadingIndicator(),
                  );
                } else {
                  return CustomElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        await accessCubit.postCategory(
                            name: accessCubit.name!,
                            shopId: prefs.getString('userId')!);
                      }
                    },
                    child: Text(
                      AppStrings.addShop.tr(),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 44, 31, 31)),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
