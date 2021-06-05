import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/widgets/logoAjCompleto_widget.dart';
import 'package:flutter/material.dart';
import '../../views/menu_principal_view.dart';
import 'package:movilaj/src/utils/variables.dart' as variable;

class NosotrosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          variable.NOSOTROS,
          style: estiloTexto.estiloTextoAppbar,
        ),
      ),
      drawer: MenuPrincipal(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              height: 200,
              child: LogoAjCompletoWidget(),
            ),
            Text("¿Quiénes somos y qué hacemos?",
                style: estiloTexto.estiloTitulo),
            SizedBox(
              height: 7,
            ),
            Text(
              "Somos una institución pública supedita al Ministerio de Economía y Finanzas Públicas, nuestra función está destinada a fiscalizar y controlar las actividades de juegos de lotería, azar, sorteos y promociones empresariales en el Estado Plurinacional de Bolivia.\n\nNuestro principal objetivo es proteger los derechos de la población boliviana a participar en condiciones de igualdad, legalidad y transparencia.",
              textAlign: TextAlign.center,
              style: estiloTexto.estiloTextoNormal,
            ),
          ],
        ),
      ),
    );
  }
}
