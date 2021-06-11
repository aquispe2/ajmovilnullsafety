import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:movilaj/src/utils/apis.dart' as api;

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future _backgroundHandler(RemoteMessage message) async {
    print("OCULTOOO");
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print("ABIERTO");
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print("Abrir l aapp");
  }

  static vaciarCantidadNotificaion() {}

  static Future initializeApp() async {
    //  inicializadmos cosas de notificoanes
    await Firebase.initializeApp();
    messaging.subscribeToTopic(api.TOPIC);
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
    // ====================
  }
}
