import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movilaj/src/informate/controllers/aviso_controller.dart';
import 'package:movilaj/src/informate/controllers/normativa_controller.dart';
import 'package:movilaj/src/informate/views/avisos_view.dart';
import 'package:movilaj/src/promocion-empresarial/controllers/PromocionEmpresarialController.dart';
import 'package:movilaj/src/promocion-empresarial/views/ListaPe_view.dart';
import 'package:movilaj/src/promocion-empresarial/views/PromocionEmpresarialDetalle_view.dart';
import 'package:movilaj/src/promocion-empresarial/views/buscaPe_view.dart';
import 'package:movilaj/src/promocion-empresarial/views/juegosAzar_view.dart';
import 'package:movilaj/src/promocion-empresarial/views/juegosLoteria_view.dart';
import 'package:movilaj/src/seguimiento/controllers/consultaReclamoDenunciaController.dart';
import 'package:movilaj/src/seguimiento/controllers/seguimientoTramiteController.dart';
import 'package:movilaj/src/seguimiento/views/buscaCasos_view.dart';
import 'package:movilaj/src/seguimiento/views/casoDetalle_view.dart';
import 'package:movilaj/src/seguimiento/views/seguimientoTramites_view.dart';
import 'package:movilaj/src/seguimiento/views/tramiteFisicoDetalle_view.dart';
import 'package:movilaj/src/seguimiento/views/tramitePlataformaDetalle_view.dart';
import 'package:movilaj/src/utils/colores.dart' as colores;
import 'package:get/get.dart';
import 'package:movilaj/src/views/inicio_view.dart';

// para ssl
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
// =============

void main() {
  HttpOverrides.global = new MyHttpOverrides(); // para SSL
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // inicializando estado
    Get.put(PromocionEmpresarialController());
    Get.put(ConsultasReclamosDenunciasController());
    final seguimientoTramiteController =
        Get.put(SeguimientoTramiteController());
    Get.put(NormativaController());
    Get.put(AvisoController());

    // cargamos oficinas
    seguimientoTramiteController.cargarOficinas();

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: colores.azul_oscuro_aj,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        /*routes: {
          'inicio': (BuildContext context) => InicioView(),
        },*/
        getPages: [
          GetPage(name: 'inicio', page: () => InicioView()),
          GetPage(name: 'promociones_empresariales', page: () => ListaPeView()),
          GetPage(
              name: 'promociones_empresariales_detalle',
              page: () => PromocionEmpresarialDetalleView()),
          GetPage(name: 'busca_promociones', page: () => BuscaPeView()),
          GetPage(name: 'juegos_loteria', page: () => JuegosLoteriaView()),
          GetPage(name: 'juegos_azar', page: () => JuegosAzarView()),
          GetPage(name: 'busca_casos', page: () => BuscaCasosView()),
          GetPage(name: 'caso_detalle', page: () => CasoDetalleView()),
          /*GetPage(
              name: 'consultas_reclamos_siteweb',
              page: () => ConsultasReclamosView()),
          GetPage(
              name: 'denuncias_anticorrupcion',
              page: () => DenunciasAnticorrupcionView()),*/
          GetPage(
              name: 'seguimiento_tramites',
              page: () => SeguimientoTramitesView()),
          GetPage(
              name: 'tramite_fisico_detalle',
              page: () => TramiteFisicoDetalleView()),
          GetPage(
              name: 'tramite_plataforma_detalle',
              page: () => TramitePlataformaDetalleView()),
          GetPage(name: 'aviso', page: () => AvisosView()),
        ],
        initialRoute: 'inicio');
  }
}
