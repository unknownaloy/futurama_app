import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _baseFont = GoogleFonts.lexend();

/// Display text styles
final kLightDisplayMediumTextStyle = _baseFont.copyWith(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

final kLightDisplayLargeTextStyle = _baseFont.copyWith(
  color: Colors.black,
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

/// Title text styles
final kLightTitleLargeTextStyle = _baseFont.copyWith(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

/// Body text styles
final kLightBodySmallTextStyle = _baseFont.copyWith(
  color: Colors.black,
  fontSize: 14,
);

final kLightBodyMediumTextStyle = _baseFont.copyWith(
  color: Colors.black,
  fontSize: 16,
);

final kLightBodyLargeTextStyle = _baseFont.copyWith(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

/// Label text styles
final kLightLabelSmallTextStyle = _baseFont.copyWith(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 10,
);
