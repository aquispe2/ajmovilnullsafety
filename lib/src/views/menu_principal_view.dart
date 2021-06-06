import 'dart:io';

import 'package:get/get.dart';
import 'package:movilaj/src/routes/routes.dart';
import 'package:movilaj/src/widgets/circleLogo_widget.dart';

import 'package:flutter/material.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  //final normativaController = Get.find<NormativaController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleLogoWidget(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color(0xff004d9d),
                  Color(0xff00ade7),
                ],
              )),
              child: ListTile(
                dense: true,
                /*leading: Icon(
                  Icons.label,
                  color: Colors.white,
                ),*/
                title: Text(
                  'Autoridad de Fiscalización del Juego',
                  style: estiloTexto.stlTextoBlancoHomeBold,
                ),
                onTap: () {
                  showAlertDialog(context);
                },
              ),
            ),
            Column(
                /*children: <Widget>[
                (normativaController.versionNueva.value != "")
                    ? Text(
                        normativaController.versionNueva.value,
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      )
                    : SizedBox(height: 1),
              ],*/
                ),
            Expanded(
              child:
                  Container(color: Color(0xffFFFFFF), child: _ListaOpciones()),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color(0xff004d9d),
                  Color(0xff00ade7),
                ],
              )),
              child: ListTile(
                dense: true,
                /*leading: Icon(
                  Icons.label,
                  color: Colors.white,
                ),*/
                title: Text('               Salir',
                    style: estiloTexto.stlTextoBlancoHomeBold),
                onTap: () {
                  showAlertDialog(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancelar", style: estiloTexto.estiloTitulo),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Salir", style: estiloTexto.estiloTitulo),
      onPressed: () {
        exit(0);
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Salir"),
      content: Text(
        "¿Estas seguro de salir de AJ Móvil?",
        style: TextStyle(fontSize: 12),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: Colors.blue,
      ),
      itemCount: viewRoutes.length,
      itemBuilder: (context, i) => ListTile(
        dense: true,
        contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        leading: Text("   "),
        title: Text(
          viewRoutes[i].titulo,
          style: estiloTexto.stlTextoOpcionesMenuDesplegable,
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: colores.blue_grey_darken_1,
          size: 15,
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => viewRoutes[i].view));
        },
      ),
    );
  }
}
