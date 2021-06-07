import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:movilaj/src/utils/funciones.dart';

import 'package:movilaj/src/utils/variables.dart' as variable_textos;
import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:movilaj/src/utils/colores.dart' as colores;
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
    var media = MediaQuery.of(context).size;
    double altoIcono = (media.width < 400) ? 40 : 60;
    double anchoIcono = (media.width < 400) ? 40 : 60;

    TextStyle stlTextoIconHome = (media.width < 400)
        ? estiloTexto.stlTextoIconHomePequeno
        : estiloTexto.stlTextoIconHomeNormal;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xff000000), //OR Colors.red or whatever you want
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 40,
                height: 40,
                child: Image.asset('assets/LOGO_AJ_MOVIL_PEQUENO.png'))
          ],
        ),
        elevation: 0.0,
      ),
      drawer: MenuPrincipal(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff004d9d),
            Color(0xff00ade7),
          ],
        )),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Text(
                "AJ móvil te mantiene informado sobre sorteos, concursos y juegos de azar fiscalizados y autorizados por la AJ.",
                style: estiloTexto.stlTextoBlancoHome,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Encuentra tus respuestas realizando búsquedas por nombre de empresa, nombre de promoción empresarial o palabra clave.",
                style: estiloTexto.stlTextoBlancoHome,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Revisa nuestro tutorial ",
                    style: estiloTexto.stlTextoBlancoHomeBold,
                    textAlign: TextAlign.center,
                  ),
                  Card(
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                          width: 30,
                          height: 30,
                          child:
                              Image.asset('assets/LOGO_AJ_MOVIL_PEQUENO.png')),
                    ),
                  )
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              crossAxisCount: 3,
              children: <Widget>[
                _iconoCard(
                    context,
                    "promociones_empresariales",
                    Center(
                      child: Container(
                          width: altoIcono,
                          height: anchoIcono,
                          child: Image.asset(
                              'assets/PROMOCIONES_EMPRESARIALES.png')),
                    ),
                    Text(
                      "Promociones Empresariales",
                      style: stlTextoIconHome,
                      textAlign: TextAlign.center,
                    ),
                    null),
                _iconoCard(
                    context,
                    "consultas_reclamos_siteweb",
                    Center(
                      child: Container(
                          width: altoIcono,
                          height: anchoIcono,
                          child: Image.asset('assets/CONSULTAS_RECLAMOS.png')),
                    ),
                    Text("Consultas y Reclamos",
                        style: stlTextoIconHome, textAlign: TextAlign.center),
                    "${api.SITIO_WEB}/consultas?ajmovil=true"),
                _iconoCard(
                    context,
                    "juegos_loteria",
                    Center(
                      child: Container(
                          width: altoIcono,
                          height: anchoIcono,
                          child: Image.asset('assets/LOTERIAS_DE_JUEGO.png')),
                    ),
                    Text("Juegos de Lotería",
                        style: stlTextoIconHome, textAlign: TextAlign.center),
                    null),
                _iconoCard(
                    context,
                    "denuncias_anticorrupcion",
                    Center(
                      child: Container(
                          width: altoIcono,
                          height: anchoIcono,
                          child: Image.asset(
                              'assets/DENUNCIAS_ANTICORRUPCION.png')),
                    ),
                    Text("Denuncias Anticorrupción",
                        style: stlTextoIconHome, textAlign: TextAlign.center),
                    "${api.SITIO_WEB}/denuncias?ajmovil=true"),
                _iconoCard(
                    context,
                    "juegos_azar",
                    Center(
                      child: Container(
                          width: altoIcono,
                          height: anchoIcono,
                          child: Image.asset('assets/JUEGOS_DE_AZAR.png')),
                    ),
                    Text("Juegos de Azar",
                        style: stlTextoIconHome, textAlign: TextAlign.center),
                    null),
                _iconoCardSeguimiento(
                    context,
                    Center(
                      child: Container(
                          width: altoIcono,
                          height: anchoIcono,
                          child: Image.asset('assets/SEGUIMIENTOS.png')),
                    ),
                    Text("Seguimientos",
                        style: stlTextoIconHome, textAlign: TextAlign.center)),
                Container(),
                _iconoCard(
                    context,
                    "mapa",
                    Center(
                      child: Container(
                          width: altoIcono,
                          height: anchoIcono,
                          child: Image.asset(
                              'assets/PROMOCIONES_EMPRESARIALES.png')),
                    ),
                    Text("Mapa",
                        style: stlTextoIconHome, textAlign: TextAlign.center),
                    null)
              ],
            ),
            Text(
              "Estado Plurinacional de Bolivia",
              style: estiloTexto.stlTextoBlancoHomeBold,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget _iconoCard(
      BuildContext context, String path, Widget icon, Text text, String? url) {
    return GestureDetector(
      onTap: () => {
        if (path == 'consultas_reclamos_siteweb' ||
            path == 'denuncias_anticorrupcion')
          {launch(url!)}
        else
          {Get.toNamed(path)}
      },
      child: Container(
        child: Card(
          elevation: 10,
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
        elevation: 10,
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
