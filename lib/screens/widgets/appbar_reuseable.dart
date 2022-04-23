import 'package:flutter/material.dart';

AppBar headerNav({
  String title = '',
  bool centerTitle = false,
  List<Widget>? action,
}) {
  return AppBar(
    title: Text(title),
    centerTitle: centerTitle,
    actions: action,
  );
}
