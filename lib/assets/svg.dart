import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum SvgLabels { googleLogo, appleLogo }

final svgPictures = {
  SvgLabels.googleLogo: SvgPicture.asset(
    'assets/icons/svg/google_logo.svg',
    semanticsLabel: 'google logo',
    fit: BoxFit.scaleDown,
  ),
  SvgLabels.appleLogo: SvgPicture.asset(
    'assets/icons/svg/apple_logo.svg',
    semanticsLabel: 'apple logo',
    fit: BoxFit.scaleDown,
  ),
};
