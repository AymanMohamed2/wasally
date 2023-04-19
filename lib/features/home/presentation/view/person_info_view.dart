import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasally/core/utils/api_services.dart';

import '../../../auth/presentation/manager/login_cubit/login_cubit.dart';
import 'widgets/person_info_view_body.dart';

class Person extends StatelessWidget {
  const Person({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(ApiServices()),
      child: const Scaffold(
        body: PersonInfoViewBody(),
      ),
    );
  }
}
