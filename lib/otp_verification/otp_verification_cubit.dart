import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'otp_verification_state.dart';

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit() : super(OtpVerificationState());

  void showDot(bool focus, String controller){
    emit(state.copyWith(

    ));
  }
}
