import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:validators/validators.dart';

class Funciones {
  bool esNumero(String str) {
    return isNumeric(str);
  }

  Future<String> downloadFile(String url, String fileName, String dir) async {
    try {
      var httpClient = new HttpClient();

      httpClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) =>
              true; // representa un certificado SSL

      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      print("prueba 1");
      var bytes = await consolidateHttpClientResponseBytes(response);
      print("prueba 2");
      File file = new File('$dir/$fileName');
      print("prueba 3");
      await file.writeAsBytes(bytes);
      return "bajar archivo con exito";
    } catch (ex) {
      print("error: " + ex.toString());
      return "error al baja  archivo: " + ex.toString();
    }
  }

  void mostrarDialog(String pTitulo, String pTexto) {
    Get.defaultDialog(
      title: pTitulo,
      middleText: pTexto,
      backgroundColor: Colors.white,
      titleStyle: TextStyle(color: Colors.blue),
      middleTextStyle: TextStyle(color: Colors.blueGrey, fontSize: 12),
    );
  }
}
