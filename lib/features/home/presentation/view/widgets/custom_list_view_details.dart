import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/utils/size_config.dart';
import 'package:wasally/core/widgets/custom_loading_indicator.dart';
import 'package:wasally/features/home/presentation/manager/category_details_cubit/category_details_cubit.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/functions/custom_error_snake_bar.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../data/models/category_details_model/document.dart';
import 'category_details_list_view.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomListViewDetailsBlocBuilder extends StatefulWidget {
  const CustomListViewDetailsBlocBuilder({super.key});

  @override
  State<CustomListViewDetailsBlocBuilder> createState() =>
      _CustomListViewDetailsBlocBuilderState();
}

class _CustomListViewDetailsBlocBuilderState
    extends State<CustomListViewDetailsBlocBuilder> {
  List<Document> shopsList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryDetailsCubit, CategoryDetailsState>(
      listener: (context, state) {
        if (state is CategoryDetailsStateSuccess) {
          shopsList.addAll(state.shopsList);
        }
        if (state is CategoryDetailsStatePaginationFailure) {
          showSnakeBar(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is CategoryDetailsStateSuccess ||
            state is CategoryDetailsStatePaginationLoading ||
            state is CategoryDetailsStatePaginationFailure) {
          if (shopsList.isNotEmpty) {
            return CategoryDetailsListView(
              documentList: shopsList,
            );
          } else {
            return Expanded(
                child: SizedBox(
                    child: Center(child: Text(AppStrings.noShops.tr()))));
          }
        } else if (state is CategoryDetailsStateFailure) {
          return Builder(
            builder: (context) {
              if (state.errMessage ==
                  "AppwriteException: null, Failed host lookup: 'cloud.appwrite.io' (0)") {
                return Expanded(
                    child: SizedBox(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.noInternetImage),
                    const Text('No Internet Connection 🌐'),
                  ],
                )));
              } else {
                return Expanded(
                  child: SizedBox(
                    child: Center(
                      child: Text(state.errMessage),
                    ),
                  ),
                );
              }
            },
          );
        } else {
          return Expanded(
            child: SizedBox(
              child: Center(
                child: CustomLoadingIndicator(
                  color: kPrimaryColor,
                  height: SizeConfig.screenHeight! * 0.04,
                  width: SizeConfig.screenWidth! * 0.04,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
