import 'package:flutter/material.dart';

class Demarcation extends StatelessWidget {
  const Demarcation({super.key, required this.length});

  final double length;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: length,
      color: Colors.white,
    );
  }
}
