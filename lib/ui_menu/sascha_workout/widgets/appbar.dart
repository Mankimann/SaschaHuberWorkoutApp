import 'package:flutter/material.dart';

class AppBarGlobal {
  static Widget buildAppBar(context, String headline) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.black87,
      centerTitle: false,
      brightness: Brightness.dark,
      title: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
            text: 'TRAINING BY SASCHA HUBER',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '\n\n $headline',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ]),
      ),
    );
  }
}
