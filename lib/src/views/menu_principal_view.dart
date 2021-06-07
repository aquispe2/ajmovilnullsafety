import 'dart:io';

import 'package:get/get.dart';
import 'package:movilaj/src/routes/routes.dart';
import 'package:movilaj/src/widgets/circleLogo_widget.dart';

import 'package:flutter/material.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/apis.dart' as api;
import 'package:url_launcher/url_launcher.dart';

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
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color(0xff004d9d),
                  Color(0xff00ade7),
                ],
              )),
              child: Center(
                child: Text(
                  'Autoridad de Fiscalización del Juego',
                  style: estiloTexto.stlTextoBlancoHomeBold,
                ),
              ),
            ),
            Expanded(
              child:
                  Container(color: Color(0xffFFFFFF), child: _ListaOpciones()),
            ),
            GestureDetector(
              onTap: () {
                showAlertDialog(context);
              },
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xff004d9d),
                    Color(0xff00ade7),
                  ],
                )),
                child: Center(
                  child: Text(
                    'Salir',
                    style: estiloTexto.stlTextoBlancoHomeBold,
                  ),
                ),
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
      child: Text("Cancelar", style: estiloTexto.stlTexto),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Salir", style: estiloTexto.stlTexto),
      onPressed: () {
        exit(0);
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Salir",
        style: estiloTexto.stlSubTitulo,
      ),
      content: Text(
        "¿Estas seguro de salir de AJ Móvil?",
        style: estiloTexto.stlTexto,
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
      //physics: BouncingScrollPhysics(),
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
        /*trailing: Icon(
          Icons.chevron_right,
          color: colores.blue_grey_darken_1,
          size: 15,
        ),*/
        onTap: () {
          if (viewRoutes[i].titulo == "Consultas y Reclamos") {
            launch("${api.SITIO_WEB}/consultas?ajmovil=true");
          } else if (viewRoutes[i].titulo == "Denuncias Anticorrupción") {
            launch("${api.SITIO_WEB}/denuncias?ajmovil=true");
          } else if (viewRoutes[i].titulo == "Seguimientos") {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: Text(
                      "Seguimientos",
                      textAlign: TextAlign.center,
                    ),
                    children: <Widget>[
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Para realizar el seguimiento presione una de las siguientes opciones de acuerdo a su elección y/o preferencia ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.0),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Get.toNamed("busca_casos");
                              },
                              child: const Text('Seguimiento de casos'),
                            ),
                            OutlinedButton(
                              onPressed: () async {
                                Get.toNamed("seguimiento_tramites");
                              },
                              child: const Text('Seguimiento de trámites'),
                            ),
                          ])
                    ],
                  );
                });
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => viewRoutes[i].view!));
          }
        },
      ),
    );
  }
}
