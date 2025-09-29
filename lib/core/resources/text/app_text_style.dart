import 'package:flutter/material.dart';

/// App text style.
enum AppTextStyle {
  light14(
    TextStyle(
      fontSize: 14,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w300,
    ),
  ),
  regular10(
    TextStyle(
      fontSize: 10,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
    ),
  ),
  regular12(
    TextStyle(
      fontSize: 12,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
    ),
  ),
  regular13(
    TextStyle(
      fontSize: 13,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
    ),
  ),
  regular14(
    TextStyle(
      fontSize: 14,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  regular16(
    TextStyle(
      fontSize: 16,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  regular20(
    TextStyle(
      fontSize: 20,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  medium10(
    TextStyle(
      fontSize: 10,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  medium12(
    TextStyle(
      fontSize: 10,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  medium14(
    TextStyle(
      fontSize: 14,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  medium15(
    TextStyle(
      fontSize: 15,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  medium16(
    TextStyle(
      fontSize: 16,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  medium18(
    TextStyle(
      fontSize: 18,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  medium20(
    TextStyle(
      fontSize: 20,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  medium24(
    TextStyle(
      fontSize: 24,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  medium30(
    TextStyle(
      fontSize: 30,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  medium32(
    TextStyle(
      fontSize: 32,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  medium36(
    TextStyle(
      fontSize: 36,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  semiBold15(
    TextStyle(
      fontSize: 15,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w600,
    ),
  ),
  semiBold17(
    TextStyle(
      fontSize: 17,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w600,
    ),
  ),
  semiBold13(
    TextStyle(
      fontSize: 13,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
    ),
  ),
  semiBold20(
    TextStyle(
      fontSize: 20,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w600,
    ),
  ),
  semiBold24(
    TextStyle(
      fontSize: 24,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
    ),
  ),
  semiBold40(
    TextStyle(
      fontSize: 40,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
    ),
  ),
  bold12(
    TextStyle(
      fontSize: 12,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
  bold13(
    TextStyle(
      fontSize: 13,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
  bold14(
    TextStyle(
      fontSize: 14,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
  bold15(
    TextStyle(
      fontSize: 15,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  bold16(
    TextStyle(
      fontSize: 16,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  bold17(
    TextStyle(
      fontSize: 17,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    ),
  ),
  bold20(
    TextStyle(
      fontSize: 20,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
  bold22(
    TextStyle(
      fontSize: 22,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
  bold24(
    TextStyle(
      fontSize: 24,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
  bold25(
    TextStyle(
      fontSize: 25,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
  bold26(
    TextStyle(
      fontSize: 26,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
  bold32(
    TextStyle(
      fontSize: 32,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
  bold36(
    TextStyle(
      fontSize: 36,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
  bold42(
    TextStyle(
      fontSize: 42,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
  bold48(
    TextStyle(
      fontSize: 48,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
  bold50(
    TextStyle(
      fontSize: 50,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
  extraBold33(
    TextStyle(
      fontSize: 33,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w800,
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
