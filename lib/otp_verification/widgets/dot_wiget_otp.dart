import 'package:flutter/material.dart';

class DotWidgetOtp extends StatelessWidget {
  final String param;
  final VoidCallback? onPressed;

  const DotWidgetOtp({
    Key? key,
    required this.param,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color:const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}