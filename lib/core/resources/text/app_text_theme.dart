import 'package:flutter/material.dart';
import 'app_text_style.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  /// Text style 13_140.200
  final TextStyle light14;

  /// Text style 10_140.400
  final TextStyle regular10;

  /// Text style 12_140.400
  final TextStyle regular12;

  /// Text style 13_140.400
  final TextStyle regular13;

  /// Text style 14_140.500
  final TextStyle regular14;

  /// Text style 16_140.500
  final TextStyle regular16;

 /// Text style 16_140.500
  final TextStyle regular20;

  /// Text style 10_140_500.
  final TextStyle medium10;

 /// Text style 12_140_500.
  final TextStyle medium12;

  /// Text style 14_140_500.
  final TextStyle medium14;

  /// Text style 15_140_500.
  final TextStyle medium15;

 /// Text style 16_140_500.
  final TextStyle medium16;

  /// Text style 18_140_500.
  final TextStyle medium18;

  /// Text style 20_140_500.
  final TextStyle medium20;

  /// Text style 24_140_500.
  final TextStyle medium24;

  /// Text style 30_140_500.
  final TextStyle medium30;

  /// Text style 30_140_500.
  final TextStyle medium36;

 /// Text style 32_140_500.
  final TextStyle medium32;

  final TextStyle semiBold13;

  /// Text style 15_140_600.
  final TextStyle semiBold15;

  /// Text style 17_140_600.
  final TextStyle semiBold17;

  /// Text style 20_140_600.
  final TextStyle semiBold20;

  /// Text style 17_140_600.
  final TextStyle semiBold24;

  /// Text style 17_140_600.
  final TextStyle semiBold40;

  /// Text style 12_140.700
  final TextStyle bold12;

  /// Text style 13_140.700
  final TextStyle bold13;

  /// Text style 15_140_500.
  final TextStyle bold14;

  /// Text style 15_140_500.
  final TextStyle bold15;

  /// Text style 16_140_500.
  final TextStyle bold16;

  /// Text style 17_140_500.
  final TextStyle bold17;

  /// Text style 20_140_700.
  final TextStyle bold20;

  /// Text style 22_140_700.
  final TextStyle bold22;

  /// Text style 24_140_700.
  final TextStyle bold24;

  /// Text style 25_124_700.
  final TextStyle bold25;

  /// Text style 26_140_700.
  final TextStyle bold26;

  /// Text style 32_140_700.
  final TextStyle bold32;

  /// Text style 36_140_700.
  final TextStyle bold36;

  /// Text style 42_140_700.
  final TextStyle bold42;

 /// Text style 48_140_700.
  final TextStyle bold48;

  /// Text style 50_140_700.
  final TextStyle bold50;

  /// Text style 33_140_900.
  final TextStyle extraBold33;


  AppTextTheme._({
    required this.light14,
    required this.regular10,
    required this.regular12,
    required this.regular13,
    required this.regular14,
    required this.regular16,
    required this.regular20,
    required this.medium10,
    required this.medium12,
    required this.medium14,
    required this.medium15,
    required this.medium16,
    required this.medium18,
    required this.medium20,
    required this.medium24,
    required this.medium30,
    required this.medium32,
    required this.medium36,
    required this.semiBold15,
    required this.semiBold17,
    required this.semiBold13,
    required this.semiBold20,
    required this.semiBold24,
    required this.semiBold40,
    required this.bold12,
    required this.bold13,
    required this.bold14,
    required this.bold15,
    required this.bold16,
    required this.bold17,
    required this.bold20,
    required this.bold22,
    required this.bold24,
    required this.bold25,
    required this.bold26,
    required this.bold32,
    required this.bold36,
    required this.bold42,
    required this.bold48,
    required this.bold50,
    required this.extraBold33,
  });

  /// Base app text theme.
  AppTextTheme.base()
      : light14 = AppTextStyle.light14.value,
        regular10 = AppTextStyle.regular10.value,
        regular12 = AppTextStyle.regular12.value,
        regular13 = AppTextStyle.regular13.value,
        regular14 = AppTextStyle.regular14.value,
        regular16 = AppTextStyle.regular16.value,
        regular20 = AppTextStyle.regular20.value,
        medium10 = AppTextStyle.medium10.value,
        medium12 = AppTextStyle.medium12.value,
        medium14 = AppTextStyle.medium14.value,
        medium15 = AppTextStyle.medium15.value,
        medium16 = AppTextStyle.medium16.value,
        medium18 = AppTextStyle.medium18.value,
        medium20 = AppTextStyle.medium20.value,
        medium24 = AppTextStyle.medium24.value,
        medium30 = AppTextStyle.medium30.value,
        medium32 = AppTextStyle.medium32.value,
        medium36 = AppTextStyle.medium36.value,
        semiBold13 = AppTextStyle.semiBold13.value,
        semiBold15 = AppTextStyle.semiBold15.value,
        semiBold17 = AppTextStyle.semiBold17.value,
        semiBold24 = AppTextStyle.semiBold24.value,
        semiBold20 = AppTextStyle.semiBold20.value,
        semiBold40 = AppTextStyle.semiBold40.value,
        bold12 = AppTextStyle.bold12.value,
        bold13 = AppTextStyle.bold13.value,
        bold14 = AppTextStyle.bold14.value,
        bold15 = AppTextStyle.bold15.value,
        bold16 = AppTextStyle.bold16.value,
        bold17 = AppTextStyle.bold17.value,
        bold20 = AppTextStyle.bold20.value,
        bold22 = AppTextStyle.bold22.value,
        bold24 = AppTextStyle.bold24.value,
        bold25 = AppTextStyle.bold25.value,
        bold26 = AppTextStyle.bold26.value,
        bold32 = AppTextStyle.bold32.value,
        bold36 = AppTextStyle.bold36.value,
        bold42 = AppTextStyle.bold42.value,
        bold48 = AppTextStyle.bold48.value,
        bold50 = AppTextStyle.bold50.value,
        extraBold33 = AppTextStyle.extraBold33.value;

  @override
  // ignore: long-parameter-list
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? light14,
    TextStyle? regular10,
    TextStyle? regular12,
    TextStyle? regular13,
    TextStyle? regular14,
    TextStyle? regular16,
    TextStyle? regular20,
    TextStyle? medium10,
    TextStyle? medium12,
    TextStyle? medium14,
    TextStyle? medium15,
    TextStyle? medium16,
    TextStyle? medium18,
    TextStyle? medium20,
    TextStyle? medium24,
    TextStyle? medium30,
    TextStyle? medium32,
    TextStyle? medium36,
    TextStyle? semiBold15,
    TextStyle? semiBold17,
    TextStyle? semiBold13,
    TextStyle? semiBold20,
    TextStyle? semiBold24,
    TextStyle? semiBold40,
    TextStyle? bold12,
    TextStyle? bold13,
    TextStyle? bold14,
    TextStyle? bold15,
    TextStyle? bold16,
    TextStyle? bold17,
    TextStyle? bold20,
    TextStyle? bold22,
    TextStyle? bold24,
    TextStyle? bold25,
    TextStyle? bold26,
    TextStyle? bold32,
    TextStyle? bold36,
    TextStyle? bold42,
    TextStyle? bold48,
    TextStyle? bold50,
    TextStyle? extraBold33,
  }) {
    return AppTextTheme._(
      light14: light14 ?? this.light14,
      regular10: regular10 ?? this.regular10,
      regular12: regular12 ?? this.regular12,
      regular13: regular13 ?? this.regular13,
      regular14: regular14 ?? this.regular14,
      regular16: regular14 ?? this.regular16,
      regular20: regular14 ?? this.regular20,
      medium10: medium10 ?? this.medium10,
      medium12: medium12 ?? this.medium12,
      medium14: medium14 ?? this.medium14,
      medium15: medium15 ?? this.medium15,
      medium16: medium16 ?? this.medium16,
      medium18: medium18 ?? this.medium18,
      medium20: medium20 ?? this.medium20,
      medium24: medium24 ?? this.medium24,
      medium30: medium30 ?? this.medium30,
      medium32: medium32 ?? this.medium32,
      medium36: medium36 ?? this.medium36,
      semiBold15: semiBold15 ?? this.semiBold15,
      semiBold17: semiBold17 ?? this.semiBold17,
      semiBold13: semiBold13 ?? this.semiBold13,
      semiBold20: semiBold20 ?? this.semiBold20,
      semiBold24: semiBold24 ?? this.semiBold24,
      semiBold40: semiBold40 ?? this.semiBold40,
      bold12: bold12 ?? this.bold12,
      bold13: bold13 ?? this.bold13,
      bold14: bold14 ?? this.bold14,
      bold15: bold15 ?? this.bold15,
      bold16: bold16 ?? this.bold16,
      bold17: bold17 ?? this.bold17,
      bold20: bold20 ?? this.bold20,
      bold22: bold22 ?? this.bold22,
      bold24: bold24 ?? this.bold24,
      bold25: bold25 ?? this.bold25,
      bold26: bold26 ?? this.bold26,
      bold32: bold32 ?? this.bold32,
      bold36: bold24 ?? this.bold36,
      bold42: bold42 ?? this.bold42,
      bold48: bold48 ?? this.bold48,
      bold50: bold50 ?? this.bold50,
      extraBold33: extraBold33 ?? this.extraBold33,
    );
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return copyWith(
      light14: TextStyle.lerp(light14, other.light14, t),
      regular10: TextStyle.lerp(regular10, other.regular10, t),
      regular13: TextStyle.lerp(regular13, other.regular13, t),
      regular16: TextStyle.lerp(regular16, other.regular16, t),
      regular20: TextStyle.lerp(regular20, other.regular20, t),
      medium10: TextStyle.lerp(medium10, other.medium10, t),
      medium12: TextStyle.lerp(medium12, other.medium12, t),
      medium14: TextStyle.lerp(medium14, other.medium14, t),
      medium15: TextStyle.lerp(medium15, other.medium15, t),
      medium16: TextStyle.lerp(medium16, other.medium16, t),
      medium18: TextStyle.lerp(medium18, other.medium18, t),
      medium20: TextStyle.lerp(medium20, other.medium20, t),
      medium30: TextStyle.lerp(medium30, other.medium30, t),
      medium32: TextStyle.lerp(medium32, other.medium32, t),
      medium36: TextStyle.lerp(medium36, other.medium36, t),
      semiBold15: TextStyle.lerp(semiBold15, other.semiBold15, t),
      semiBold17: TextStyle.lerp(semiBold17, other.semiBold17, t),
      semiBold20: TextStyle.lerp(semiBold20, other.semiBold20, t),
      semiBold24: TextStyle.lerp(semiBold24, other.semiBold24, t),
      semiBold40: TextStyle.lerp(semiBold40, other.semiBold40, t),
      bold13: TextStyle.lerp(bold13, other.bold13, t),
      bold14: TextStyle.lerp(bold14, other.bold14, t),
      bold15: TextStyle.lerp(bold15, other.bold15, t),
      bold16: TextStyle.lerp(bold16, other.bold16, t),
      bold17: TextStyle.lerp(bold17, other.bold17, t),
      bold20: TextStyle.lerp(bold20, other.bold20, t),
      bold22: TextStyle.lerp(bold22, other.bold22, t),
      bold24: TextStyle.lerp(bold24, other.bold24, t),
      bold25: TextStyle.lerp(bold25, other.bold25, t),
      bold26: TextStyle.lerp(bold26, other.bold26, t),
      bold32: TextStyle.lerp(bold32, other.bold32, t),
      bold36: TextStyle.lerp(bold36, other.bold36, t),
      bold42: TextStyle.lerp(bold42, other.bold42, t),
      bold48: TextStyle.lerp(bold48, other.bold48, t),
      bold50: TextStyle.lerp(bold50, other.bold50, t),
      extraBold33: TextStyle.lerp(extraBold33, other.extraBold33, t),
    );
  }

  /// Return text theme for app from context
  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>() ??
        _throwThemeExceptionFromFunc(context);
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextTheme не найдена в $context');
