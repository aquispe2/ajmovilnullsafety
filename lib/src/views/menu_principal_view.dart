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
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleLogoWidget(),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            /*Column(
              children: <Widget>[
                (normativaController.versionNueva.value != "")
                    ? Text(
                        normativaController.versionNueva.value,
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      )
                    : SizedBox(height: 1),
              ],
            ),*/
            Expanded(
              child:
                  Container(color: Color(0xffFFFFFF), child: _ListaOpciones()),
            ),
            Container(
              decoration: BoxDecoration(
                color: colores.grey_lighten_2,
              ),
              child: ListTile(
                dense: true,
                leading: Icon(
                  Icons.label,
                  color: colores.blue_grey_darken_2,
                ),
                title: Text('Salir',
                    style: TextStyle(
                        fontSize: 14, color: colores.blue_grey_darken_2)),
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
        color: colores.blue_grey_darken_1,
      ),
      itemCount: viewRoutes.length,
      itemBuilder: (context, i) => ListTile(
        dense: true,
        contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        leading: Text("holaa"),
        title: Text(
          viewRoutes[i].titulo,
          style: estiloTexto.estiloTextoNormal,
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
