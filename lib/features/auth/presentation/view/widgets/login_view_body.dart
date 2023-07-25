import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '../../../../../core/utils/size_config.dart';
import 'login_bloc_consumer.dart';
import 'login_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessCubit = BlocProvider.of<LoginCubit>(context);
    TextEditingController controller = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        margin: EdgeInsets.only(
            left: SizeConfig.screenWidth! * 0.07,
            right: SizeConfig.screenWidth! * 0.07),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoginSection(
                accessCubit: accessCubit,
                controller: controller,
              ),
              ButtonBlocBonsumer(formKey: formKey, accessCubit: accessCubit),
            ],
          ),
        ),
      ),
    );
  }
}
