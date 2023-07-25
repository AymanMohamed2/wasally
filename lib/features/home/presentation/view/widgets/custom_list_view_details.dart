import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/widgets/custom_loading_indicator.dart';
import 'package:wasally/features/home/presentation/manager/category_details_cubit/category_details_cubit.dart';
import '../../../../../core/constants.dart';
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
  @override
  Widget build(BuildContext context) {
    List<Document> shopsList = [];

    return BlocConsumer<CategoryDetailsCubit, CategoryDetailsState>(
      listener: (context, state) {
        if (state is CategoryDetailsStateSuccess) {
          shopsList.addAll(state.shopsList);
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
          return Expanded(
              child: SizedBox(child: Center(child: Text(state.errMessage))));
        } else {
          return const Expanded(
            child: SizedBox(
              child: Center(
                child: CustomLoadingIndicator(
                  color: kPrimaryColor,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
