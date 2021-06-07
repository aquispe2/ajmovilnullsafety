import 'package:movilaj/src/widgets/circleLogo_widget.dart';
import 'package:flutter/material.dart';

import '../../views/menu_principal_view.dart';
import 'package:movilaj/src/utils/variables.dart' as variables;
import 'package:movilaj/src/utils/apis.dart' as api;
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/colores.dart' as colores;

class AcercaAppView extends StatefulWidget {
  @override
  _AcercaAppViewState createState() => _AcercaAppViewState();
}

class _AcercaAppViewState extends State<AcercaAppView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            variables.ACERCA_APP,
            style: estiloTexto.stlTituloBarBlanco,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colores.azul_claro_aj, colores.azul_oscuro_aj],
              ),
            ),
          )),
      drawer: MenuPrincipal(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/LOGO_AJ_MOVIL_PEQUENO.png')),
              SizedBox(
                height: 10,
              ),
              Text(
                "Esta aplicación te permitirá verificar los concursos, sorteos y juegos de azar legales, autorizados y fiscalizados por la AJ.\n\nLa AJ cuida que las actividades de juego, azar y promociones empresariales en Bolivia se desarrollen con legalidad, transparencia y en condiciones de igualdad.",
                textAlign: TextAlign.center,
                style: estiloTexto.stlTexto,
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Versión ${api.VERSION_APP}',
                style: estiloTexto.stlTextoBold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
