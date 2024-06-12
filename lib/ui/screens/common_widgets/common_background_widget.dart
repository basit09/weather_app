import 'package:flutter/material.dart';
import 'package:weather_app_task/infrastructure/commons/constants/color_constants.dart';
import 'package:weather_app_task/infrastructure/commons/constants/image_constants.dart';

class CommonBackgroundContainer extends StatelessWidget {
  final Widget childWidget;
  const CommonBackgroundContainer({
    required this.childWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: ColorConstants.backgroundGradient,
        image: DecorationImage(
          image: AssetImage(ImageConstants.backgroundImage),
          fit: BoxFit.fill,
        ),
      ),
      child: childWidget,
    );
  }
}