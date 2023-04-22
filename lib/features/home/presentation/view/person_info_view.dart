import 'package:flutter/material.dart';

import 'widgets/person_info_view_body.dart';

class Person extends StatelessWidget {
  const Person({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PersonInfoViewBody(),
    );
  }
}
