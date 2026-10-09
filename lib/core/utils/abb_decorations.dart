import 'package:flutter/cupertino.dart';

abstract class AbbDecorations {
  static var greyBoxDecorations = ShapeDecoration(
    color: Color(0x7ff2f3f3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(4),
    ),
  );
}
