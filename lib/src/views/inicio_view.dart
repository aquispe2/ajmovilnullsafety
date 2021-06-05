import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:movilaj/src/utils/funciones.dart';

import 'package:movilaj/src/utils/variables.dart' as variable_textos;
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/widgets/header_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:movilaj/src/utils/apis.dart' as api;

import 'menu_principal_view.dart';

class InicioView extends StatefulWidget {
  @override
  _InicioViewState createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  //final seguimientoTramiteController = Get.find<SeguimientoTramiteController>();
  Funciones objFuncion = new Funciones();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(variable_textos.INICIO, style: estiloTexto.estiloTextoAppbar),
        elevation: 0.0,
      ),
      drawer: MenuPrincipal(),
      body: Stack(
        children: <Widget>[
          HeaderWidget(),
          Container(
            padding: EdgeInsets.only(top: 180),
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(16.0),
              childAspectRatio: 8.0 / 9.0,
              children: <Widget>[
                _iconoCard(
                    context,
                    "promociones_empresariales",
                    Center(
                      child: Icon(
                        Icons.audiotrack,
                        color: Colors.green,
                        size: 30.0,
                      ),
                    ),
                    Text(
                      "Promociones Empresariales",
                      style: TextStyle(fontSize: 10, color: Color(0xff1565C0)),
                      textAlign: TextAlign.center,
                    ),
                    null),
                _iconoCard(
                    context,
                    "consultas_reclamos_siteweb",
                    Center(
                      child: Icon(
                        Icons.audiotrack,
                        color: Colors.green,
                        size: 30.0,
                      ),
                    ),
                    Text("Consultas y Reclamos",
                        style:
                            TextStyle(fontSize: 10, color: Color(0xff1565C0)),
                        textAlign: TextAlign.center),
                    "${api.SITIO_WEB}/consultas?ajmovil=true"),
                _iconoCard(
                    context,
                    "juegos_loteria",
                    Center(
                      child: Icon(
                        Icons.audiotrack,
                        color: Colors.green,
                        size: 30.0,
                      ),
                    ),
                    Text("Juegos de Lotería",
                        style:
                            TextStyle(fontSize: 10, color: Color(0xff1565C0)),
                        textAlign: TextAlign.center),
                    null),
                _iconoCard(
                    context,
                    "denuncias_anticorrupcion",
                    Center(
                      child: Icon(
                        Icons.audiotrack,
                        color: Colors.green,
                        size: 30.0,
                      ),
                    ),
                    Text("Denuncias Anticorrupción",
                        style:
                            TextStyle(fontSize: 10, color: Color(0xff1565C0)),
                        textAlign: TextAlign.center),
                    "${api.SITIO_WEB}/denuncias?ajmovil=true"),
                _iconoCard(
                    context,
                    "juegos_azar",
                    Center(
                      child: Icon(
                        Icons.audiotrack,
                        color: Colors.green,
                        size: 30.0,
                      ),
                    ),
                    Text("Juegos de Azar",
                        style:
                            TextStyle(fontSize: 10, color: Color(0xff1565C0)),
                        textAlign: TextAlign.center),
                    null),
                _iconoCardSeguimiento(
                    context,
                    Center(
                      child: Icon(
                        Icons.audiotrack,
                        color: Colors.green,
                        size: 30.0,
                      ),
                    ),
                    Text("Seguimiento",
                        style:
                            TextStyle(fontSize: 10, color: Color(0xff1565C0)),
                        textAlign: TextAlign.center)),
                Container(),
                _iconoCard(
                    context,
                    "mapa",
                    Center(
                      child: Icon(
                        Icons.audiotrack,
                        color: Colors.green,
                        size: 30.0,
                      ),
                    ),
                    Text("Mapa",
                        style:
                            TextStyle(fontSize: 10, color: Color(0xff1565C0)),
                        textAlign: TextAlign.center),
                    null)
              ],
            ),
          )
        ],
      ),
    );
  }

  GestureDetector _iconoCard(BuildContext context, String path, Widget icon,
      Widget text, String? url) {
    return GestureDetector(
      onTap: () => {
        if (path == 'consultas_reclamos_siteweb' ||
            path == 'denuncias_anticorrupcion')
          {launch(url!)}
        else
          {Get.toNamed(path)}
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: icon,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 3.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _iconoCardSeguimiento(
      BuildContext context, Widget icon, Widget text) {
    return GestureDetector(
      onTap: () async {
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
                          style: TextStyle(color: Colors.black, fontSize: 12.0),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Get.toNamed("busca_casos");
                          },
                          child: const Text('Seguimiento de casos'),
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            //await seguimientoTramiteController.cargarOficinas();
                            Get.toNamed("seguimiento_tramites");
                          },
                          child: const Text('Seguimiento de trámites'),
                        ),
                      ])
                ],
              );
            });
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: icon,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 3.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
