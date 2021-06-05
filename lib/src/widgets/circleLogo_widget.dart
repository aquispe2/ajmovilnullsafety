import 'package:flutter/material.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;

class CircleLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: colores.blue_grey_darken_2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 80,
                height: 80,
                child: Image.asset('assets/logo_aj.png')),
            Text(
              "Móvil",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            )
          ],
        ));
  }
}
