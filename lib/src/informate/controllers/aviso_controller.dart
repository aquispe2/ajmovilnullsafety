import 'package:get/get.dart';
import 'package:movilaj/src/informate/models/aviso_model.dart';
import 'package:movilaj/src/informate/models/normativa_model.dart';
import 'package:movilaj/src/informate/services/aviso_service.dart';
import 'package:movilaj/src/informate/services/normativa_service.dart';

class AvisoController extends GetxController {
  final _avisoService = new AvisoService();

  // PARA AVISOS
  var lstAviso = new List<AvisoModel>.empty().obs;
  var descargandoAviso = false.obs;
  // ====================

  void obtenerAviso() async {
    descargandoAviso.value = true;
    lstAviso.value = await _avisoService.obtenerAviso();
    descargandoAviso.value = false;
  }

  void limpiarAviso() async {
    lstAviso.value = new List<AvisoModel>.empty();
  }
}
