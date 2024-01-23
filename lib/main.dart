import 'package:flutter/material.dart';
import 'package:manaze/application.dart';
import 'package:manaze/locator.dart';

void main() async {
  await locator();
  runApp(const Application());
}
