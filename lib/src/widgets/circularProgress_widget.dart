import 'package:flutter/material.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;

class CircularProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 4,
        backgroundColor: colores.blue_grey_lighten_5,
        valueColor:
            new AlwaysStoppedAnimation<Color>(colores.blue_grey_darken_1),
      ),
    );
  }
}



