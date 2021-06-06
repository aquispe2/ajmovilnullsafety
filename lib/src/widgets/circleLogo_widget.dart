import 'package:flutter/material.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;

class CircleLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return CircleAvatar(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 80,
                height: 80,
                child: Image.asset('assets/LOGO_AJ_MOVIL_PEQUENO.png')),
          ],
        ),
        radius: 28,
      ),
    );*/

    return CircleAvatar(
      backgroundColor: Color(0xff056bab),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 90,
                height: 90,
                child: Image.asset('assets/LOGO_AJ_MOVIL_PEQUENO.png')),
          ],
        ),
        radius: 75,
      ),
    );
  }
}
