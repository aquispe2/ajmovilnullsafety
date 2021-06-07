import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/utils/funciones.dart';
import 'package:movilaj/src/utils/variables.dart' as variable;
import 'package:movilaj/src/views/menu_principal_view.dart';

class AvisosView extends StatefulWidget {
  @override
  _AvisosViewState createState() => _AvisosViewState();
}

class _AvisosViewState extends State<AvisosView> {
  Funciones objFuncion = new Funciones();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          variable.BUSQUEDA_CASOS,
          style: estiloTexto.stlTituloBarBlanco,
        ),
      ),
      drawer: MenuPrincipal(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Text("holaaaa soy avisoooo")],
        ),
      ),
    );
  }
}
