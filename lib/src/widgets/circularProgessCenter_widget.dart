import 'package:flutter/material.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;

class CircularProgressCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Center(
            child: Container(
          margin: EdgeInsets.all(10),
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            backgroundColor: colores.blue_grey_lighten_5,
            valueColor:
                new AlwaysStoppedAnimation<Color>(colores.blue_grey_darken_1),
          ),
        )));
  }
}
