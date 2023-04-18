import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_loading_indicator.dart';
import '../manager/categories_cubit/home_cubit.dart';
import 'custom_item_home.dart';

class CustomGrideView extends StatelessWidget {
  const CustomGrideView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    var accessCubit = BlocProvider.of<CategoriesCubit>(context);
    return Expanded(
      child: BlocBuilder<CategoriesCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeStateLoading) {
            return const Center(
              child: CustomLoadingIndicator(),
            );
          } else if (state is HomeStateSuccess) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: state.categories.documents!.length,
              itemBuilder: (context, index) {
                return CustomItemHomeView(
                  name: state.categories.documents![index].name,
                  imageUrl: state.categories.documents![index].image,
                );
              },
            );
          } else if (state is HomeStateFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
