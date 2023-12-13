import 'package:flutter/material.dart';
class DotWidget extends StatefulWidget {
  const DotWidget({super.key});

  @override
  State<DotWidget> createState() => _DotWidgetState();
}

class _DotWidgetState extends State<DotWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color(0xFF0F1828),
      ),
    );
  }
}
