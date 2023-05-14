import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_screen_onboarding_flutter/circle_progress_bar.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:wasally/core/utils/size_config.dart';

/// A IntroScreen Class.

class CustomOnBoarding extends StatefulWidget {
  final List<Introduction>? introductionList;
  final Color? backgroudColor;
  final Color? foregroundColor;
  final TextStyle? skipTextStyle;
  final String text;

  /// Callback on Skip Button Pressed
  final Function()? onTapSkipButton;
  const CustomOnBoarding({
    Key? key,
    this.text = 'Skip',
    this.introductionList,
    this.onTapSkipButton,
    this.backgroudColor,
    this.foregroundColor,
    this.skipTextStyle = const TextStyle(fontSize: 20),
  }) : super(key: key);

  @override
  _CustomOnBoardingState createState() => _CustomOnBoardingState();
}

class _CustomOnBoardingState extends State<CustomOnBoarding> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  double progressPercent = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Material(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            color: widget.backgroudColor ?? Theme.of(context).colorScheme.background,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: widget.onTapSkipButton,
                          child: Text(widget.text, style: widget.skipTextStyle),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      height: SizeConfig.screenHeight! * 0.5,
                      width: SizeConfig.screenWidth! * 0.5,
                      child: PageView(
                        physics: const ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: widget.introductionList!,
                      ),
                    ),
                  ),
                  _customProgress(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customProgress() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: CircleProgressBar(
            backgroundColor: Colors.white,
            foregroundColor:
                widget.foregroundColor ?? Theme.of(context).primaryColor,
            value: ((_currentPage + 1) * 1.0 / widget.introductionList!.length),
          ),
        ),
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (widget.foregroundColor ?? Theme.of(context).primaryColor)
                .withOpacity(0.5),
          ),
          child: IconButton(
            onPressed: () {
              _currentPage != widget.introductionList!.length - 1
                  ? _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    )
                  : widget.onTapSkipButton!();
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
            iconSize: 15,
          ),
        )
      ],
    );
  }
}
