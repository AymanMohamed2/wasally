import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/complete_order/data/repositories/complete_order_repo_Impl.dart';
import 'package:wasally/features/complete_order/presentation/manager/pick_image_cubit/pick_image_cubit.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/bloc_consumer_wasally_button.dart';
import 'package:wasally/features/complete_order/presentation/view/widgets/complete_order_view_body.dart';
import '../../../../core/dependncy_injection/service_locator.dart';
import '../../../auth/presentation/manager/verify_cubit/verify_cubit.dart';
import '../manager/complete_order_button_cubit/complete_order_button_cubit.dart';
import '../manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';

class CompleteOrderView extends StatelessWidget {
  CompleteOrderView({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.categoryName,
  });
  final String title;
  final String imageUrl;
  final String categoryName;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var accessCubit = BlocProvider.of<CompleteOrderCubit>(context);
    var accessVerifyCubit = BlocProvider.of<VerifyCubit>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CompleteOrderGetLocationCubit()),
        BlocProvider(
            create: (context) =>
                PickImageCubit(getIt.get<CompleteOrderRepoImpl>())),
      ],
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: [Image.asset(imageUrl)],
            title: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          floatingActionButton: BlocConsumerWasallyButton(
              categoryName: categoryName,
              formKey: _formKey,
              accessVerifyCubit: accessVerifyCubit,
              title: title,
              accessCubit: accessCubit,
              controller: _controller),
          body: CompleteOrderViewBody(
            catigoryName: categoryName,
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
