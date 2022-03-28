import 'package:flutter/material.dart';

class TransparentAppBar extends AppBar {
  TransparentAppBar({
    Key? key,
    bool? centerTitle,
    Widget? title,
    List<Widget>? actions,
  }) : super(
          key: key,
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: centerTitle,
          title: title,
          actions: actions,
        );
}
