import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/home/presentation/manager/category_details_cubit/category_details_cubit.dart';

import '../../../data/models/category_details_model/document.dart';
import 'custom_item_details.dart';

class CategoryDetailsListView extends StatefulWidget {
  const CategoryDetailsListView({
    super.key,
    required this.documentList,
  });

  final List<Document> documentList;

  @override
  State<CategoryDetailsListView> createState() =>
      _CategoryDetailsListViewState();
}

class _CategoryDetailsListViewState extends State<CategoryDetailsListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;

  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<CategoryDetailsCubit>(context)
            .getCategoryDetails(pageNumber: nextPage++);
        print('Shops get done');

        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.documentList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return CustomItemDetailsView(
              document: widget.documentList[index],
            );
          },
        ),
      ),
    );
  }
}
