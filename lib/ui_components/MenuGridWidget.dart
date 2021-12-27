import 'package:flutter/material.dart';

class MenuGridWidget extends StatelessWidget {
    const MenuGridWidget({Key key,  this.color,  this.content,
       this.text,  this.isTapped}) : super(key: key);

  final Text text;
  final Color color;
  final Widget content;
  final Function isTapped;

  @override
  Widget build(BuildContext context) {

  return GestureDetector(
    onTap: isTapped(),
    child:  Container(
      child: Center( child:  Column(
        children: [
          Row(
            children: [
              Center(child:
              content, widthFactor: 2,),
            ],
          ),
          text,
        ],
      ),
      ),
      margin: const EdgeInsetsDirectional.all(9),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black54, blurRadius: 15.0, spreadRadius: 5.0,
              offset: Offset(15.0 , 15.0))],

      ),

    ),

  );

  }}