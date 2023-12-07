import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static const primary =  TextStyle(
    color: AppColors.textPrimary,
    fontFamily: 'Muslish',
  );

  static final primaryS24W700 = primary.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static final primaryS18W600 = primary.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final primaryS16W600 = primary.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final primaryS14W600 = primary.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final primaryS14W400 = primary.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final primaryS12W400 = primary.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final primaryS10W400 = primary.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
}
