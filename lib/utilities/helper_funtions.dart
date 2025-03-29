import 'package:flutter/material.dart';

double setValuesBasedOnOrientation({
  required double ifTrue,
  required double ifFalse,
  required BuildContext context,
}) {
  final orientation = MediaQuery.of(context).orientation;
  return (orientation == Orientation.landscape) ? ifTrue : ifFalse;
}
