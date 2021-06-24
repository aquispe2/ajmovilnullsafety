import 'package:get/get.dart';
import 'package:movilaj/src/seguimiento/models/derivacionFisico_model.dart';
import 'package:movilaj/src/seguimiento/models/derivacion_model.dart';
import 'package:movilaj/src/seguimiento/models/oficina_model.dart';
import 'package:movilaj/src/seguimiento/models/seguimientoTramiteFisico_model.dart';
import 'package:movilaj/src/seguimiento/models/seguimientoTramitePlataforma_model.dart';
import 'package:movilaj/src/seguimiento/services/seguimientoTramite_service.dart';

class SeguimientoTramiteController extends GetxController {
  final _seguimientoTramiteService = new SeguimientoTramiteService();

  var lstSeguimientoTramiteFisico =
      new List<SeguimientoTramiteFisicoModel>.empty().obs;
  var descargandoSeguimientoTramiteFisico = false.obs;

  var lstSeguimientoTramitePlataforma =
      new List<SeguimientoTramitePlataformaModel>.empty().obs;
  var descargandoSeguimientoTramitePlataforma = false.obs;

  var lstOficina = new List<OficinaModel>.empty().obs;

  var lstDerivaciones = new List<DerivacionModel>.empty().obs;
  var descargandoDerivaciones = false.obs;

  var lstDerivacionesFisico = new List<DerivacionFisicoModel>.empty().obs;
  var descargandoDerivacionesFisico = false.obs;

  Future<bool> cargarSeguimientoTramiteFisico(
      int pGestion, int pOficinaId, int pNroHr) async {
    descargandoSeguimientoTramiteFisico.value = true;
    lstSeguimientoTramiteFisico.value = await _seguimientoTramiteService
        .obtenerSeguimientoTramiteFisico(pGestion, pOficinaId, pNroHr);
    descargandoSeguimientoTramiteFisico.value = false;
    if (lstSeguimientoTramiteFisico.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> cargarSeguimientoTramitePlataforma(int pTramiteId) async {
    descargandoSeguimientoTramitePlataforma.value = true;
    lstSeguimientoTramitePlataforma.value = await _seguimientoTramiteService
        .obtenerSeguimientoTramitePlataforma(pTramiteId);

    descargandoSeguimientoTramitePlataforma.value = false;
    if (lstSeguimientoTramitePlataforma.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> cargarOficinas() async {
    lstOficina.value = await _seguimientoTramiteService.obtenerOficinas();
    if (lstOficina.value.length > 0)
      return true;
    else
      return false;
  }

  Future<bool> cargarDerivacionTramite(int pTramiteId) async {
    print("obsss");
    print(pTramiteId);
    descargandoDerivaciones.value = true;
    lstDerivaciones.value =
        await _seguimientoTramiteService.obtenerDerivacionTramite(pTramiteId);
    print(lstDerivaciones.length);
    descargandoDerivaciones.value = false;
    return true;
  }

  Future<bool> cargarDerivacionTramiteFisico(int pTramiteId) async {
    print("derivacion");
    descargandoDerivacionesFisico.value = true;
    lstDerivacionesFisico.value = await _seguimientoTramiteService
        .obtenerDerivacionTramiteFisico(pTramiteId);
    print(lstDerivacionesFisico.length);
    descargandoDerivacionesFisico.value = false;
    print("derivacion fim");
    return true;
  }
}
