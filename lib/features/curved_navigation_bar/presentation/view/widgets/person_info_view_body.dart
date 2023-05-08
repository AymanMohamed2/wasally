import 'package:flutter/material.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/person_body_section.dart';
import 'package:wasally/features/curved_navigation_bar/presentation/view/widgets/person_header_section.dart';

class PersonInfoViewBody extends StatefulWidget {
  const PersonInfoViewBody({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonInfoViewBody> createState() => _PersonInfoViewBodyState();
}

class _PersonInfoViewBodyState extends State<PersonInfoViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: const [
              PersonHeaderSection(),
              PersonBodySection(),
            ],
          ),
        ),
      ),
    );
  }
}
