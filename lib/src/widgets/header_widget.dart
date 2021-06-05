import 'package:flutter/material.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fondoPlomo = Container(
      height: 250,
      color: colores.blue_grey_darken_1,
    );

    final circulo = Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    return Stack(
      children: <Widget>[
        fondoPlomo,
        Positioned(
          top: 90,
          left: 20.0,
          child: circulo,
        ),
        Positioned(
          top: 0,
          right: -20.0,
          child: circulo,
        ),
        Container(
          padding: EdgeInsets.only(top: 0),
          child: Column(
            children: <Widget>[
              Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/logo_aj.png')),
              SizedBox(
                height: 10,
                width: double.infinity,
              ),
              Text(
                'Te mantiene informado sobre sorteos, concursos y juegos de azar, fiscalizados y autorizados por la AJ\n\nEncuentra tus respuestas y has búsquedas por nombre de empresa, nombre de promoción empresarial o palabra clave',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
                textAlign: TextAlign.center,
              )
            ],
          ),
        )
      ],
    );
  }
}
