import 'package:get/get.dart';
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

  void cargarSeguimientoTramiteFisico(
      int pGestion, int pOficinaId, int pNroHr) async {
    descargandoSeguimientoTramiteFisico.value = true;
    lstSeguimientoTramiteFisico.value = await _seguimientoTramiteService
        .obtenerSeguimientoTramiteFisico(pGestion, pOficinaId, pNroHr);
    descargandoSeguimientoTramiteFisico.value = false;
  }

  void cargarSeguimientoTramitePlataforma(int pTramiteId) async {
    descargandoSeguimientoTramitePlataforma.value = true;
    lstSeguimientoTramitePlataforma.value = await _seguimientoTramiteService
        .obtenerSeguimientoTramitePlataforma(pTramiteId);

    print('resultado v2:   ${lstSeguimientoTramitePlataforma.length}');
    descargandoSeguimientoTramitePlataforma.value = false;
  }

  Future<bool> cargarOficinas() async {
    lstOficina.value = await _seguimientoTramiteService.obtenerOficinas();
    if (lstOficina.value.length > 0)
      return true;
    else
      return false;
  }
}
