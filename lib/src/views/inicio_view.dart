import 'dart:io';

import 'package:badges/badges.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:movilaj/src/informate/controllers/aviso_controller.dart';
import 'package:movilaj/src/models/PushNotification_model.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movilaj/src/informate/controllers/normativa_controller.dart';

import 'package:movilaj/src/utils/funciones.dart';

import 'package:movilaj/src/utils/estilos.dart' as estiloTexto;
import 'package:store_redirect/store_redirect.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:movilaj/src/utils/apis.dart' as api;

import '../widgets/NotificationBadge_widget.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'menu_principal_view.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class InicioView extends StatefulWidget {
  @override
  _InicioViewState createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  Funciones objFuncion = new Funciones();
  final normativaController = Get.find<NormativaController>();
  final avisoController = Get.find<AvisoController>();

// ============= PUSH ======================
  late final FirebaseMessaging _messaging;
  late int _totalNotifications;
  PushNotification? _notificationInfo;

  void registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;
    _messaging.subscribeToTopic(api.TOPIC);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print(
            'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');

        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
        );

        setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        });

        if (_notificationInfo != null) {
          // For displaying the notification as an overlay
          showSimpleNotification(
            Text(_notificationInfo!.title!),
            //leading: NotificationBadge(totalNotifications: _totalNotifications),
            subtitle: Text(_notificationInfo!.body!),
            background: colores.azul_claro_aj,
            duration: Duration(seconds: 2),
          );
        }
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  // For handling notification when the app is in terminated state
  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
        dataTitle: initialMessage.data['title'],
        dataBody: initialMessage.data['body'],
      );

      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    }
  }

  @override
  void initState() {
    _totalNotifications = 0;
    registerNotification();
    checkForInitialMessage();

    // For handling notification when the app is in background
    // but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );

      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    });

    super.initState();
  }

  // =======================fin push ====================

  @override
  Widget build(BuildContext context) {
    normativaController.verificarVersion();
    var media = MediaQuery.of(context).size;
    double altoIcono = (media.width < 400) ? 90 : 115;
    double anchoIcono = (media.width < 400) ? 90 : 115;

    TextStyle stlTextoIconHome = (media.width < 400)
        ? estiloTexto.stlTextoIconHomePequeno
        : estiloTexto.stlTextoIconHomeNormal;

    return WillPopScope(
      onWillPop: _clickAtras,
      child: Scaffold(
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
              Column(
                children: [
                  Obx(() => (normativaController.versionNueva.value != "")
                      ? GestureDetector(
                          onTap: () => {
                                StoreRedirect.redirect(
                                    androidAppId: "bo.gob.aj.movilaj")
                              }, // hay q revisar no esta yendo al tutorial
                          child: Container(
                            color: Colors.red[100],
                            padding: EdgeInsets.all(5),
                            child: Text(normativaController.versionNueva.value),
                          ))
                      : Container()),
                ],
              ),
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
                    Obx(() => (avisoController.vEnlace.value != "")
                        ? GestureDetector(
                            onTap: () => {
                              launch(avisoController.vEnlace.value)
                            }, // hay q revisar no esta yendo al tutorial
                            child: Card(
                              elevation: 6,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    child: Image.asset(
                                        'assets/LOGO_AJ_MOVIL_PEQUENO.png')),
                              ),
                            ),
                          )
                        : Container()),
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
                            child:
                                Image.asset('assets/CONSULTAS_RECLAMOS.png')),
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
                          style: stlTextoIconHome,
                          textAlign: TextAlign.center)),
                  Container(),
                  //NotificationBadge(totalNotifications: _totalNotifications),
                  if (_totalNotifications == 0)
                    _iconoCard(
                        context,
                        "aviso",
                        Center(
                          child: Container(
                              width: altoIcono,
                              height: anchoIcono,
                              child: Image.asset('assets/AVISO.png')),
                        ),
                        Text("Avisos",
                            style: stlTextoIconHome,
                            textAlign: TextAlign.center),
                        null)
                  else
                    Badge(
                        position: BadgePosition.topEnd(top: 0, end: 0),
                        padding: EdgeInsets.all(7),
                        animationDuration: Duration(milliseconds: 300),
                        animationType: BadgeAnimationType.slide,
                        badgeContent: Text(
                          _totalNotifications.toString(),
                          style: estiloTexto.stlTextoBlancoHome,
                        ),
                        child: _iconoCard(
                            context,
                            "aviso",
                            Center(
                              child: Container(
                                  width: altoIcono,
                                  height: anchoIcono,
                                  child: Image.asset('assets/AVISO.png')),
                            ),
                            Text("Avisos",
                                style: stlTextoIconHome,
                                textAlign: TextAlign.center),
                            null)),
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
      ),
    );
  }

  Widget _iconoCard(
      BuildContext context, String path, Widget icon, Text text, String? url) {
    return GestureDetector(
      onTap: () => {
        if (path == 'consultas_reclamos_siteweb' ||
            path == 'denuncias_anticorrupcion')
          {
            launch(url!)
            //_launchInWebViewWithJavaScript(url!)
          }
        else if (path == 'aviso')
          {_totalNotifications = 0, Get.toNamed(path)}
        else
          {Get.toNamed(path)}
      },
      child: Container(
        child: Card(
          elevation: 10,
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              icon
              /*Padding(
                padding: EdgeInsets.fromLTRB(16.0, 3.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text,
                  ],
                ),
              ),*/
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
            /*AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: icon,
            ),*/
            icon
            /*Padding(
              padding: EdgeInsets.fromLTRB(16.0, 3.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text,
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
        enableDomStorage: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  String obtenerCantidad(Stream cantidad) {
    cantidad.listen((cantidad) {
      print(cantidad);
      return cantidad;
    });
    return ' ';
  }

  Future<bool> _clickAtras() {
    print("CLICK SALIR");
    exit(0);
  }
}
