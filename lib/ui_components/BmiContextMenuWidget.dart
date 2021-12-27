
import 'package:flutter/material.dart';

class BmiContextMenuWidget extends StatelessWidget {
  const BmiContextMenuWidget({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final item =   <DropdownMenuItem> [

    ];
    return Container(
    child: Column(
      children: [
        Row(
          children: [
            DropdownButton(items: item, onChanged: null),
          ],
      mainAxisAlignment: MainAxisAlignment.center,
        )
      ],
    ),

    );
  }
}
