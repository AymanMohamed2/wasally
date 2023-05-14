import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/custom_loading_indicator.dart';
import 'package:wasally/features/home/presentation/manager/category_details_cubit/category_details_cubit.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_strings.dart';
import 'custom_item_details.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomListViewDetails extends StatelessWidget {
  const CustomListViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsCubit, CategoryDetailsState>(
      builder: (context, state) {
        if (state is CategoryDetailsStateSuccess) {
          if (state.categoryDetailsModel.total != 0) {
            return Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: state.categoryDetailsModel.documents!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomItemDetailsView(
                      document: state.categoryDetailsModel.documents![index],
                    );
                  },
                ),
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.defaultSize! * 30,
                ),
                Text(AppStrings.noShops.tr()),
              ],
            );
          }
        } else if (state is CategoryDetailsStateFailure) {
          return Column(
            children: [
              SizedBox(
                height: SizeConfig.defaultSize! * 30,
              ),
              Text(state.errMessage),
            ],
          );
        } else {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.defaultSize! * 30,
                ),
                const CustomLoadingIndicator(
                  color: kPrimaryColor,
                  height: 30,
                  width: 30,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
