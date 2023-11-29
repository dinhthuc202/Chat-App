import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'otp_verification_cubit.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpVerificationCubit, OtpVerificationState>(
      buildWhen: (previous, current){
        return previous.showDot != current.showDot;
      },
      builder: (context,state) {
        return Scaffold(
          body: Row(
            children: [
              Container(),
            ],
          ),
        );
      }
    );
  }
}
