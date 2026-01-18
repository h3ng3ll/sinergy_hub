import 'package:fluttertoast/fluttertoast.dart';

import '../resources/colors/app_colors.dart';

final class UiMessageService {
  static Future<void> showError(
    String msg, {
    int timeInSecondsDuration = 5,
  }) async {
    await Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: timeInSecondsDuration,
      // gravity: ToastGravity.BOTTOM_LEFT,
      webPosition: 'center',
      // webBgColor:
      //     ' linear-gradient(to right ${AppColors.pictorialCarmine.value.toHex(
      //       leadingHashSign: false,
      //     )} ${AppColors.persia|nPink.value.toHex(
      //       leadingHashSign: false,
      //     )})',
    );
  }

  static Future<void> showInfo(
    String msg, {
    int timeInSecondsDuration = 3,
  }) async {
    await Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: timeInSecondsDuration,
      textColor: AppColors.white.value,
      webPosition: 'center',
      backgroundColor: AppColors.black.value,
    );
  }

  static Future<void> showSuccess(
    String msg, {
    int timeInSecondsDuration = 3,
  }) async {
    await Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: timeInSecondsDuration,
      textColor: AppColors.white.value,
      // backgroundColor: AppColors.verseGreen.value,
      webPosition: 'center',
    );
  }
}
