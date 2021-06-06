import 'package:get/get.dart';
import 'package:movilaj/src/seguimiento/models/casoAdjunto_model.dart';
import 'package:movilaj/src/seguimiento/models/caso_model.dart';
import 'package:movilaj/src/seguimiento/services/consultasReclamosDenuncias_service.dart';

class ConsultasReclamosDenunciasController extends GetxController {
  final _consultasReclamosDenunciasService =
      new ConsultasReclamosDenunciasService();

  // PARA CASO
  var lstCaso = new List<CasoModel>.empty().obs;
  var descargandoCaso = false.obs;
  // ==================================

  // PARA ADJUNTO CASO
  var lstCasoAdjunto = new List<CasoAdjuntoModel>.empty().obs;
  var descargandoCasoAdjunto = false.obs;
  // ==================================

  Future<bool> cargarCasosPorNroCaso(String pNroCaso) async {
    try {
      descargandoCaso.value = true;
      lstCaso.value = await _consultasReclamosDenunciasService
          .obtenerCasoPorNroCaso(pNroCaso);
      descargandoCaso.value = false;
      if (lstCaso.length > 0) {
        print("CASO ENVONTRADO");
        return true;
      } else {
        print("CASO NO ENVONTRADO");
        return false;
      }
    } catch (ex) {
      descargandoCaso.value = false;
      return false;
    }
  }

  void cargarAdjuntoCasosPorCasoId(int pCasoId) async {
    descargandoCasoAdjunto.value = true;
    lstCasoAdjunto.value = await _consultasReclamosDenunciasService
        .obtenerCasoAdjuntoPorCasoId(pCasoId);
    descargandoCasoAdjunto.value = false;
  }
}
