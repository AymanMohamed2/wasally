import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/home/presentation/manager/category_details_cubit/category_details_cubit.dart';
import 'package:wasally/features/home/presentation/view/widgets/category_details_body.dart';

import '../../../../core/networking/api_services.dart';
import '../../data/repositories/home_repo_impl.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({
    super.key,
    required this.title,
    required this.collectionId,
    required this.image,
  });
  final String title;
  final String collectionId;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CategoryDetailsCubit(HomeRepoImpl(ApiServices(Dio())))
                  ..getCategoryDetails(),
          ),
        ],
        child: CategoryDetailsBody(
          image: image,
          title: title,
        ),
      ),
    );
  }
}
