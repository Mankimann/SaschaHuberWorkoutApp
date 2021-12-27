import 'package:flutter/material.dart';

class RoundButtonWidget extends StatelessWidget {
  const RoundButtonWidget({Key key,  this.color,
     this.content,  this.isTapped,
     this.text, }) : super(key: key);

  final Color color;
  final Widget content;
  final Function isTapped;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: isTapped(),
      child: Container (
      child: content,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(70.0)
        ),

      ),

    );
  }
}
